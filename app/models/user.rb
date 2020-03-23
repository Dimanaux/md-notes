class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :username, presence: true

  has_many :notes, dependent: :destroy

  def to_param
    username
  end
end
