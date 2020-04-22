class Note < ApplicationRecord
  belongs_to :author, class_name: "User"

  validates :slug, :title, presence: true, uniqueness: { scope: :author_id }
  validates :content, presence: true

  paginates_per 12

  scope :recent, -> { order(created_at: :desc) }
  scope :published, -> { where("published_at IS NOT NULL AND published_at <= CURRENT_TIMESTAMP") }

  def published?
    published_at && published_at < Time.current
  end

  def to_param
    slug
  end
end
