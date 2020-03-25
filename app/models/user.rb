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

  def followers
    User.joins("INNER JOIN subscriptions ON users.id = subscriptions.follower_id")
        .where("subscriptions.subscription_id = ?", id)
  end

  def subscriptions
    # User.joins("INNER JOIN subscriptions ON users.id = subscriptions.subscription_id")
    #     .where("subscriptions.follower_id = ?", id)
    users
  end

  alias subscriptions= users=
  alias subscribers followers

  def subscribe_to(other_user)
    subscriptions << other_user
  end

  def subscribed_to?(other_user)
    subscriptions.include? other_user
  end

  def unsubscribe_from(other_user)
    subscriptions.destroy(other_user)
  end

  def to_param
    username
  end
end
