FactoryBot.define do
  sequence(:email) { FFaker::Internet.email }
  sequence(:title) { |n| "Note ##{n} #{FFaker::Lorem.phrase}" }
end
