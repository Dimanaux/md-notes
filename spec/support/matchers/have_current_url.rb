RSpec::Matchers.define :have_current_url do |expected_url|
  match do |page|
    %r{^(https?://)?#{expected_url}/?$}i.match? page.current_url
  end

  failure_message do |page|
    "Expected that #{page} would have url '#{expected}' but had '#{page.current_url}'"
  end
end
