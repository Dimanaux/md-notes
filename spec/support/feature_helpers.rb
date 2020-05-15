# Extend this module in spec/support/features/*.rb
module FeatureHelpers
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature

  config.before(type: :feature) do
    default_url_options[:host] = "http://lvh.me:5000"
  end
end
