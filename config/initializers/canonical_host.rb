# Ensure requests are only served from one, canonical host name
if ENV["CANONICAL_HOST"]
  Rails.application.config.middleware.use Rack::CanonicalHost, ENV["CANONICAL_HOST"]
end
