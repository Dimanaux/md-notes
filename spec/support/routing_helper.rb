RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers

  config.before(type: :routing) do
    default_url_options[:host] = "http://lvh.me:5000"
  end
end
