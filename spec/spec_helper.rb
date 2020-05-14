require "simplecov"

SimpleCov.start "rails" do
  add_filter "/.bundle"
  add_group "Decorators", "app/decorators"
  add_group "Interactors", "app/interactors"
end

RSpec.configure do |config|
  config.backtrace_exclusion_patterns << /\.bundle/

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
