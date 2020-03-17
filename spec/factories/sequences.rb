FactoryBot.define do
  sequence(:email) { FFaker::Internet.email }
  sequence(:title) { |n| "#{FFaker::Lorem.phrase} #{n}" }
end
