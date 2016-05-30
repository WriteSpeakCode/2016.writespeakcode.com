source 'https://rubygems.org'

# Process manager for applications with multiple components (http://github.com/ddollar/foreman)
gem 'foreman'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Full-stack web application framework. (http://rubyonrails.org)
gem 'rails', '4.2.5'

# Heroku magic
# Following best practices from http://12factor.net run a maintainable, clean, and scalable app on Rails (https://github.com/heroku/rails_12factor)
gem 'rails_12factor', group: [:production, :staging]

# Sass adapter for the Rails asset pipeline. (https://github.com/rails/sass-rails)
gem 'sass-rails', '~> 5.0'

# Ruby wrapper for UglifyJS JavaScript compressor (http://github.com/lautis/uglifier)
gem 'uglifier', '>= 1.3.0'

# CoffeeScript adapter for the Rails asset pipeline. (https://github.com/rails/coffee-rails)
gem 'coffee-rails', '~> 4.1.0'

# an asset gemification of the font-awesome icon font library (https://github.com/bokmann/font-awesome-rails)
gem "font-awesome-rails"

# Use jQuery with Rails 4+ (http://rubygems.org/gems/jquery-rails)
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster (https://github.com/turbolinks/turbolinks-rails)
gem 'turbolinks'

# Create JSON structures via a Builder-style DSL (https://github.com/rails/jbuilder)
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
# rdoc html with javascript search index. (http://github.com/voloko/sdoc)
gem 'sdoc', '~> 0.4.0', group: :doc

# let your Gemfile do the configuring (http://github.com/indirect/haml-rails)
gem 'haml-rails', '~> 0.9'

# Simple static page rendering controller (http://github.com/thoughtbot/high_voltage)
gem 'high_voltage', '~> 3.0.0'

# Your friendly neighborhood hash library. (https://github.com/intridea/hashie)
gem 'hashie'

# An ActiveRecord-like model that uses a hash or file as a datasource (http://github.com/zilkey/active_hash)
gem 'active_hash'

# Markdown that smells nice (http://github.com/vmg/redcarpet)
gem 'redcarpet'

# The administration framework for Ruby on Rails. (http://activeadmin.info)
gem 'activeadmin', '~> 1.0.0.pre2'

# Flexible authentication solution for Rails with Warden (https://github.com/plataformatec/devise)
gem 'devise', '~> 3.5'

# View Models for Rails (http://github.com/drapergem/draper)
gem 'draper', '~> 1.3'

# An email validator for Rails 3+. (https://github.com/balexand/email_validator)
gem 'email_validator'

# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/] (https://bitbucket.org/ged/ruby-pg)
gem 'pg', '~> 0.18.2'

# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications (http://puma.io)
gem "puma"

group :development, :test do
  # Patch-level verification for Bundler (https://github.com/rubysec/bundler-audit#readme)
  gem "bundler-audit", require: false

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Ruby 2.0 fast debugger - base + CLI (http://github.com/deivid-rodriguez/byebug)
  gem 'byebug'

  # Capybara aims to simplify the process of integration testing Rack applications, such as Rails, Sinatra or Merb (https://github.com/jnicklas/capybara)
  gem 'capybara'

  # Autoload dotenv in Rails. (https://github.com/bkeepers/dotenv)
  gem 'dotenv-rails'

  # factory_girl_rails provides integration between factory_girl and rails 3 (http://github.com/thoughtbot/factory_girl_rails)
  gem 'factory_girl_rails', '~> 4.5.0'

  # Easily generate fake data (https://github.com/stympy/faker)
  gem 'faker', github: 'stympy/faker'

  # Makes Jasmine easier on Rails 3.2 &amp; up (http://github.com/searls/jasmine-rails)
  gem 'jasmine-rails'

  # Use Pry as your rails console (https://github.com/rweng/pry-rails)
  gem 'pry-rails'

  # RSpec for Rails (https://github.com/rspec/rspec-rails)
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  # Strategies for cleaning databases.  Can be used to ensure a clean state for testing. (http://github.com/DatabaseCleaner/database_cleaner)
  gem "database_cleaner"

  # Making tests easy on the fingers and eyes (http://thoughtbot.com/community/)
  gem "shoulda-matchers", require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  # A debugging tool for your Ruby on Rails applications. (https://github.com/rails/web-console)
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # Rails application preloader (https://github.com/rails/spring)
  gem 'spring'
end
