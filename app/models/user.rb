class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :username, presence: true, uniqueness: true,
                       format: { with: /\A[\w-]+\z/, message: I18n.t("errors.username") }

  has_many :notes, foreign_key: "author_id", dependent: :destroy, inverse_of: :author

  has_many :followers_subscribtions,
           foreign_key: :followee_id, class_name: "Subscription",
           dependent: :destroy, inverse_of: :followee
  has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :followers_subscribtions
  has_many :followees, through: :subscriptions

  def to_param
    username
  end
end
