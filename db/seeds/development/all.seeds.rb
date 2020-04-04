def create_user(username)
  User.create(
      username: username,
      email: "#{username}@example.com",
      password: "123456",
      confirmed_at: 1.second.ago
  )
end

create_user("user")

(1..5).each { |no| create_user("user_#{no}") }
