class Note < ApplicationRecord
  belongs_to :user

  validates :slug, presence: true, uniqueness: { scope: :user }

  def to_param
    slug
  end
end
