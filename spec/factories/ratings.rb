FactoryBot.define do
  factory :rating do
    association :user
    association :note
    value { 5 }
  end
end
