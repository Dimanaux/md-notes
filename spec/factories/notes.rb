FactoryBot.define do
  factory :note do
    title { FFaker::Lorem.phrase }
    content { "MyText" }
    slug { title.parameterize }
    association :user
  end
end
