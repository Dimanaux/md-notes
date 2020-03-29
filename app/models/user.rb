class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :username, presence: true, uniqueness: true

  has_many :notes, dependent: :destroy

  has_and_belongs_to_many(
    :users,
    join_table: "subscriptions",
    foreign_key: "follower_id",
    association_foreign_key: "subscription_id"
  )

  # TODO: use 2 has_many relations instead of has_and_belongs_to_many
  # has_many :followers, class_name: "User", foreign_key: "follower_id"
  # has_many :subscriptions, class_name: "User", ...
  # has_many keys are: :class_name, :anonymous_class,
  # :foreign_key, :validate, :autosave, :table_name, :before_add,
  # :after_add, :before_remove, :after_remove, :extend, :primary_key,
  # :dependent, :as, :through, :source, :source_type, :inverse_of,
  # :counter_cache, :join_table, :foreign_type, :index_errors

  def followers
    User.joins("INNER JOIN subscriptions ON users.id = subscriptions.follower_id")
        .where("subscriptions.subscription_id = ?", id)
  end

  alias subscriptions users
  alias subscriptions= users=
  alias subscribers followers

  def subscribed_to?(other_user)
    subscriptions.include? other_user
  end

  def to_param
    username
  end
end
