class Note < ApplicationRecord
  belongs_to :user

  validates :slug, :title, presence: true, uniqueness: { scope: :user }
  validates :content, presence: true

  alias author user

  def to_param
    slug
  end
end
