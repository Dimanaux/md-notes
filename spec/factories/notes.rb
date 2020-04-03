FactoryBot.define do
  factory :note do
    title { FFaker::Lorem.phrase }
    content { "MyText" }
    slug { title.parameterize }
    association :author, factory: :user
  end
end
