class Note < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[title content author_username]

  belongs_to :user

  validates :slug, :title, presence: true, uniqueness: { scope: :user_id }
  validates :content, presence: true

  def auhtor_username
    auhtor.username
  end

  def to_param
    slug
  end
end
