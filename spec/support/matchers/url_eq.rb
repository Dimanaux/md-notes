RSpec::Matchers.define :url_eq do |expected_url|
  match do |actual_url|
    %r{^(https?://)?#{expected_url}/?$}i.match? actual_url
  end

  failure_message do |actual_url|
    "Expected that '#{actual_url}' would be equivalent to '#{expected_url}'"
  end
end
