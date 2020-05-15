RSpec::Matchers.define :have_current_url do |expected_url|
  match do |page|
    expect(page.current_url).to url_eq expected_url
  end

  failure_message do |page|
    "Expected that #{page} would have url '#{expected_url}' but had '#{page.current_url}'"
  end
end
