FactoryBot.define do
  sequence(:username) { |n| "user-no-#{n}" }
  sequence(:email) { FFaker::Internet.email }
  sequence(:title) { |n| "Note ##{n} #{FFaker::Lorem.phrase}" }
end
