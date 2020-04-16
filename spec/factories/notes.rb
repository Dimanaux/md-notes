FactoryBot.define do
  factory :note do
    title
    content { FFaker::Lorem.paragraph(5) }
    slug { title.parameterize }
    association :author, factory: :user
  end
end
