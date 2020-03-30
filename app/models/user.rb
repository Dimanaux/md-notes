class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :username, presence: true, uniqueness: true

  has_many :notes, dependent: :destroy
  has_many :followers, foreign_key: :followee_id, class_name: "Subscription", dependent: :destroy, inverse_of: :followee
  has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy, inverse_of: :follower
  has_many :followees, through: :subscriptions

  alias subscribers followers

  def subscribed_to?(other_user)
    subscriptions.where(followee: other_user).any?
  end

  def to_param
    username
  end
end
