RSpec::Matchers.define :url_eq do |expected_url|
  match do |actual_url|
    domain, path = expected_url.split("/", 2)
    %r{^(https?://)?(www\.)?#{domain}(:\d+)?/#{path}/?$}i.match? actual_url
  end

  failure_message do |actual_url|
    "Expected that '#{actual_url}' would be equivalent to '#{expected_url}'"
  end
end
