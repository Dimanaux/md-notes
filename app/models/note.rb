class Note < ApplicationRecord
  belongs_to :user

  has_many :ratings, dependent: :destroy

  validates :slug, :title, presence: true, uniqueness: { scope: :user_id }
  validates :content, presence: true

  def to_param
    slug
  end
end
