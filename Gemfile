source "https://rubygems.org"

ruby "~> 2.6.5"

gem "pg"
gem "rails", "5.2.4.3"

# assets
gem "autoprefixer-rails"
gem "foundation-icons-sass-rails"
gem "foundation-rails", "~> 6.6.2.0"
gem "premailer-rails"
gem "sass-rails", "~> 5.0.6"
gem "uglifier", ">= 2.7.2"

source "https://rails-assets.org" do
  gem "rails-assets-jquery-ujs"
  gem "rails-assets-jquery2"
end

# views
gem "active_link_to"
gem "inky-rb", require: "inky"
gem "meta-tags"
gem "simple_form"
gem "slim"

# all other gems
gem "action_policy", "~> 0.4.0"
gem "decent_decoration"
gem "decent_exposure"
gem "devise"
gem "draper"
gem "flamegraph"
gem "google-analytics-rails"
gem "health_check"
gem "interactor"
gem "kaminari"
gem "memory_profiler"
gem "pg_search"
gem "puma"
gem "rack-canonical-host"
gem "rack-mini-profiler", require: false, git: "https://github.com/MiniProfiler/rack-mini-profiler.git"
gem "redcarpet"
gem "responders"
gem "rollbar"
gem "seedbank"
gem "stackprof"
gem "wicked_pdf"
gem "wkhtmltopdf-binary"

group :staging, :production do
  gem "newrelic_rpm"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "guard-rspec"
  gem "launchy"
  gem "poltergeist"
  gem "rspec-its"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "terminal-notifier-guard"
  gem "webmock", require: false
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bullet"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "ffaker"
  gem "jasmine", "> 2.0"
  gem "jasmine-jquery-rails"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "scss_lint", require: false
  gem "slim_lint", "~> 0.11.0", require: false
end

group :development do
  gem "letter_opener"
  gem "rails-erd"
  gem "slim-rails"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  gem "web-console"
end
