FactoryBot.define do
  factory :note do
    title
    content { FFaker::Lorem.paragraph(5) }
    slug { title.parameterize }
    author
    published_at { 1.minute.ago }

    trait :unpublished do
      published_at { nil }
    end
  end
end
