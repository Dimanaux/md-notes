FactoryBot.define do
  factory :user, aliases: [:author] do
    email
    username { FFaker::InternetSE.login_user_name }
    password { "123456" }
    password_confirmation { password }
    confirmed_at { 1.hour.ago }
  end

  trait :not_confirmed do
    confirmed_at { nil }

    after(:create) do |user|
      user.update(confirmation_sent_at: 3.days.ago)
    end
  end
end
