class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :username, presence: true, uniqueness: true

  has_many :notes, dependent: :destroy
  has_many :followers_subscribtions,
           foreign_key: :followee_id, class_name: "Subscription",
           dependent: :destroy, inverse_of: :followee
  has_many :followees_subscriptions,
           foreign_key: :follower_id, class_name: "Subscription",
           dependent: :destroy, inverse_of: :follower
  has_many :followers, through: :followers_subscribtions
  has_many :followees, through: :followees_subscriptions

  alias subscribers followers

  def subscribed_to?(other_user)
    followees_subscriptions.where(followee: other_user).any?
  end

  def to_param
    username
  end
end
