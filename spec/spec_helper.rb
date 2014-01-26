# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'
require 'shoulda'
require 'faker'

require 'capybara/rails'
require 'capybara/poltergeist'

require 'factory_girl'

require 'simplecov'
require 'simplecov-rcov'
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start


ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }
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
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner[:active_record, {:connection => :test_second_db}].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
    DatabaseCleaner[:active_record, {:connection => :test_second_db}].start
  end

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.include Rails.application.routes.url_helpers
  config.extend ControllerMacros, :type => :controller
end

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  setup do
    Capybara.reset!
  end

  teardown do
    Capybara.reset!
  end
end

