class Note < ApplicationRecord
  validates :slug, presence: true, uniqueness: { scope: :user }

  belongs_to :user

  def to_param
    slug
  end
end
