FactoryBot.define do
  factory :subscription do
    association :follower, factory: :user
    association :followee, factory: :user
  end
end
