10.times do
  user = FactoryBot.create(:user)
  rand(5).times do
    FactoryBot.create(:note, author: user)
  end
end
