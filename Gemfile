# frozen_string_literal: true

source "https://rubygems.org"

gem "rails"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "view_component"
gem "tailwindcss-rails"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "http"
gem "base64"

gem "bootsnap", require: false

gem "kamal", require: false

gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "brakeman", require: false

  gem "rubocop-rails-omakase", require: false

  gem "factory_bot_rails"
  gem "test-prof"

  gem "lookbook"
  gem "listen"
  gem "actioncable"

  gem "rspec-rails"

  gem "capybara"
end

group :development do
  gem "web-console"
end
