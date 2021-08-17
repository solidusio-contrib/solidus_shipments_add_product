# frozen_string_literal: true

source 'https://rubygems.org'

# currently this gem extension is compatible only with Solidus master:
gem 'solidus', github: 'nebulab/solidus', branch: 'master'

gem 'deface', require: false
gem 'solidus_auth_devise'

gem 'rails', '>0.a'

gem 'factory_bot', '> 4.10.0'

if ENV['DB'] == 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'pg', '~> 1.2'
end

group :test do
  gem 'selenium-webdriver'
  gem 'ffaker'
  gem 'puma'
end

gemspec
