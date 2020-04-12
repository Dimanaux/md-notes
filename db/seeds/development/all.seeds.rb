10.times do
  user = FactoryBot.create(:user)
  rand(5).times do
    FactoryBot.create(:note, author: user)
  end
end

User.create(
  username: "user",
  email: "user@example.com",
  password: 123456,
  confirmed_at: 1.minute.ago
)
