FactoryBot.define do
  factory :note do
    title
    content { "MyText" }
    slug { title.parameterize }
    association :author, factory: :user
  end
end
