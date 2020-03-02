class Note < ApplicationRecord
  belongs_to :user

  validates :slug, uniqueness: { scope: :user }

  def to_param
    slug
  end
end
