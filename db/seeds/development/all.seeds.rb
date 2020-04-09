def create_user(username)
  User.create(
    username: username,
    email: "#{username}@example.com",
    password: "123456",
    confirmed_at: 1.second.ago
  )
end

def create_note(author, no)
  note = Note.new(
    author: author,
    title: "Note ##{no}",
    content: "Hello! This is note no. #{no} from #{author.username}"
  )
  Notes::UpdateSlug.call(note: note)
  note
end

create_user("user")

(1..5).each do |no|
  user = create_user("user_#{no}")
  (1..rand(4)).each do |note_no|
    create_note(user, note_no)
  end
end
