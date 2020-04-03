class Note < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :ratings, dependent: :destroy

  validates :slug, :title, presence: true, uniqueness: { scope: :author_id }
  validates :content, presence: true

  def to_param
    slug
  end
end
