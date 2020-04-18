# Extend this module in spec/support/features/*.rb
module FeatureHelpers
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature

  config.include ApplicationHelper, type: :feature
  config.include NotesHelper, type: :feature
  config.include UsersHelper, type: :feature
end
