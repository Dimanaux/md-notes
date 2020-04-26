10.times do
  user = FactoryBot.create(:user)
  rand(5).times do
    FactoryBot.create(:note, author: user)
  end
end

User.where(email: "user@example.com").first_or_create(
  username: "user",
  password: 123456,
  confirmed_at: Time.current
)
