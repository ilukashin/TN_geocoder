# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib'

gem 'config'
gem 'puma'

gem 'pg'
gem 'sequel'

gem 'dry-initializer'
gem 'dry-validation'

gem 'rake'

gem 'activesupport', require: false
gem 'fast_jsonapi'
gem 'i18n'
gem 'jwt'

group :development do
  gem 'byebug'
  gem 'rubocop', require: false
  gem 'sinatra-reloader'
  gem 'sequel-seed'
end

group :test do
  gem 'database_cleaner-sequel'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'rspec'
end
