class Note < ApplicationRecord
  belongs_to :author, class_name: "User"

  validates :slug, :title, presence: true, uniqueness: { scope: :author_id }
  validates :content, presence: true

  PER_PAGE = 12
  paginates_per PER_PAGE

  scope :recent, -> { order(created_at: :desc) }

  def to_param
    slug
  end
end
