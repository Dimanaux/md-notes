class Note < ApplicationRecord
  belongs_to :user

  validates :slug, :title, presence: true, uniqueness: { scope: :user_id }
  validates :content, presence: true

  alias author user

  def to_param
    slug
  end
end
