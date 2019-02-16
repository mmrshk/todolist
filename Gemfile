source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'pg'
gem 'pry'
gem 'puma', '~> 3.11'
gem 'figaro'
gem 'jb'
gem 'jwt'
gem 'rack-cors', require: 'rack/cors'
gem 'pundit'
gem 'fast_jsonapi'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bcrypt'
gem 'simple_command'
gem 'acts_as_list'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'json_matchers', '~> 0.7'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
