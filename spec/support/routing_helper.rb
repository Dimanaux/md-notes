RSpec.configure do |config|
  config.include ApplicationHelper, type: :routing
  config.include NotesHelper, type: :routing
  config.include UsersHelper, type: :routing
  config.include Capybara::DSL
end
