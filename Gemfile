# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
gem 'activestorage'
gem 'bootstrap-sass'
gem 'devise'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'faker'
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'letter_opener', group: :development
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'pundit'
gem 'rails', '~> 5.2.0'
gem 'rails-controller-testing'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'stripe'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'rubocop'
  gem 'rubocop-minitest' # or gem 'rubocop-rspec' depending on your test suite
  gem 'rubocop-performance'
  gem 'rubocop-rails'
end

group :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
  gem 'factory_bot_rails'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'shoulda-matchers', '~> 5.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'simplecov', require: false, group: :test
