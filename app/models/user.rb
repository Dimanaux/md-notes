class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :username, presence: true, uniqueness: true,
                       format: { with: /\A[\w-]+\z/, message: I18n.t("errors.username") }

  has_many :notes, foreign_key: "author_id", dependent: :destroy, inverse_of: :author
  has_many :ratings, dependent: :destroy

  def to_param
    username
  end
end
