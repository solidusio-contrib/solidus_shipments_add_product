# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_shipments_add_product/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_shipments_add_product'
  s.version     = SolidusShipmentsAddProduct::VERSION
  s.summary     = 'Adds back "add product" button in admin/order_shipments page'
  s.description = 'Solidus retrocompatibility extension that allows admins to add products directly in the admin/order_shipments page' # rubocop:disable Metrics/LineLength
  s.license     = 'BSD-3-Clause'

  s.author    = 'Andrea Longhi'
  s.email     = 'andrealonghi@nebulab.it'
  s.homepage  = 'https://github.com/solidusio-contrib/solidus_shipments_add_product'

  s.required_ruby_version = '~> 2.4'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = s.homepage if s.homepage
  end

  s.add_dependency 'deface', '~> 1.3'
  s.add_dependency 'solidus_core', ['>= 2.0.0', '< 3']
  s.add_dependency 'solidus_support', '~> 0.4.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.76.0'
  s.add_development_dependency 'rubocop-rails', '2.3.0'
  s.add_development_dependency 'rubocop-rspec', '1.36'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'solidus_dev_support'
  s.add_development_dependency 'sqlite3'
end
