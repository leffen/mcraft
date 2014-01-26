source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

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
gem 'devise', "3.2.2"


gem "jquery-ui-rails"
gem "bootstrap-sass", "~> 2.3.2.1"
gem 'bourbon'
gem "font-awesome-sass-rails", "~> 3.0.2.2"
gem "simple_form","~> 3.0.0.rc"
gem 'foreman'
gem 'cancan'

# Application config
gem 'hashugar', github: 'alex-klepa/hashugar'

gem 'dotenv-rails'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# caching
gem 'dalli'

# Images
gem 'carrierwave_direct', :git => "https://github.com/leffen/carrierwave_direct.git" # "git://github.com/dwilkie/carrierwave_direct.git"
gem 'carrierwave'

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem "guard-bundler"

  gem "better_errors"
  gem "binding_of_caller"
end



group :test do
  gem "database_cleaner"
  gem "email_spec"
  gem "shoulda-matchers"
  gem 'faker'
  gem 'factory_girl'
  gem "poltergeist", "~> 1.5.0"
end

group :development do
  gem "letter_opener", "~> 1.2.0"
  gem "quiet_assets", "~> 1.0.2"
end

group :test, :development do
  gem 'sqlite3'
  gem "rspec-rails"
  gem 'fabrication', require: false
  gem 'rb-fsevent', require: RUBY_PLATFORM =~ /darwin/i ? 'rb-fsevent' : false
  gem 'rb-inotify', '~> 0.9', require: RUBY_PLATFORM =~ /linux/i ? 'rb-inotify' : false
  gem 'shoulda', require: false
  gem 'simplecov', require: false
  gem 'terminal-notifier-guard', require: false
  gem 'mocha', require: false
end
