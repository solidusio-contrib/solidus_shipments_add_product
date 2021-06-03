# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_shipments_add_product/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_shipments_add_product'
  s.version     = SolidusShipmentsAddProduct::VERSION
  s.summary     = 'Adds back "add product" button in admin/order_shipments page'
  s.description = 'Solidus retrocompatibility extension that allows admins
                    to add products directly in the admin/order_shipments page'
  s.license     = 'BSD-3-Clause'

  s.author    = 'Andrea Longhi'
  s.email     = 'andrealonghi@nebulab.it'
  s.homepage  = 'https://github.com/solidusio-contrib/solidus_shipments_add_product'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'deface', '~> 1.3'
  s.add_dependency 'solidus_core', '~> 2.9'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.74.0'
  s.add_development_dependency 'rubocop-rails', '2.3.0'
  s.add_development_dependency 'rubocop-rspec', '1.35'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
