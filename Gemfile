source 'https://rubygems.org'

# TODO this is the PR that is removing the functionality from Solidus.
# Once that PR is merged in master, this can be changed.
gem 'solidus', github: 'nebulab/solidus', branch: 'no-product-add-at-shipments'

gem 'solidus_auth_devise'
gem 'deface', require: false

gem 'rails', '~> 5.1.0' # HACK: for broken bundler dependency resolution

gem 'factory_bot', '> 4.10.0'

if ENV['DB'] == 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'pg', '~> 0.21'
end

group :test do
  gem 'selenium-webdriver'
  gem 'ffaker'
  gem 'puma'
end

gemspec
