source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'therubyracer', require: 'v8'
gem 'thin'


gem 'jquery-rails'
gem "jquery-ui-rails"
gem "bootstrap-sass", "~> 2.3.1.2"
gem 'bourbon'
gem "font-awesome-sass-rails", "~> 3.0.2.2"
gem "simple_form"


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# caching
gem 'dalli'


group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem "guard-bundler"

  gem 'capistrano_colors'
  gem 'capistrano'
  gem 'capistrano-recipes'

  gem "better_errors"
  gem "binding_of_caller"
end



group :test do
  gem "capybara"
  gem "capybara-email"
  gem "database_cleaner"
  gem "email_spec"
  gem "shoulda-matchers"
end

group :development do
  gem "letter_opener", "~> 1.1.1"
  gem "quiet_assets", "~> 1.0.2"

  gem 'librarian', '>= 0.0.25', require: false
  gem 'librarian-chef'
end

group :test, :development do
  gem "rspec-rails"
  gem 'fabrication', require: false
  gem 'rb-fsevent', require: RUBY_PLATFORM =~ /darwin/i ? 'rb-fsevent' : false
  gem 'rb-inotify', '~> 0.9', require: RUBY_PLATFORM =~ /linux/i ? 'rb-inotify' : false
  gem 'shoulda', require: false
  gem 'simplecov', require: false
  gem 'terminal-notifier-guard', require: false
  gem 'mocha', require: false
end
