RSpec.configure do |config|
  config.include ApplicationHelper, type: :helper
  config.include NotesHelper, type: :helper
  config.include UsersHelper, type: :helper
end
