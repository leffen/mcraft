# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'
require 'shoulda'


require 'capybara/rails'
require 'capybara/rspec'
require "capybara-webkit"

require 'factory_girl'
FactoryGirl.find_definitions


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  config.fail_fast = ENV['RSPEC_FAIL_FAST'] == "1"
  config.mock_framework = :mocha
  config.order = 'random'

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  config.include Devise::TestHelpers, :type => :controller


  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner[:active_record,{:connection => :test_second_db}].strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
    DatabaseCleaner[:active_record,{:connection => :test_second_db}].start
  end

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.include Rails.application.routes.url_helpers

end

#Capybara.default_host = '127.0.0.1:3001'
Capybara.run_server = true
Capybara.javascript_driver = :webkit
