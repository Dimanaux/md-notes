RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :feature
  config.include Warden::Test::Helpers, type: :routing

  config.before :suite do
    Warden.test_mode!
  end

  config.after do
    Warden.test_reset!
  end
end
