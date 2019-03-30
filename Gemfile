source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'acts_as_list'
gem 'bcrypt'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'cancancan', '~> 2.0'
gem 'carrierwave'
gem 'figaro'
gem 'fog'
gem 'google-cloud-storage', '~> 1.8', require: false
gem 'jbuilder'
gem 'jwt'
gem 'mini_magick'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'pundit'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.2.2'
gem 'simple_command'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'dox', require: false
  gem 'faker'
  gem 'ffaker'
  gem 'json_matchers', '~> 0.7'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
