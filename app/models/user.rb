class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :username, presence: true
  validates :slug, presence: true

  has_many :notes

  def to_param
    username
  end
end
