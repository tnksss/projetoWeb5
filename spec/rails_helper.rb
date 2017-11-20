# This file is copied to spec/ when you run 'rails generate rspec:install'

 ENV['RAILS_ENV'] ||= 'test'

 require File.expand_path('../../config/environment', __FILE__)

 # Prevent database truncation if the environment is production

 abort("The Rails environment is running in production mode!") if Rails.env.production?

 require 'spec_helper'

 require 'rspec/rails'

 # Add additional requires below this line. Rails is not loaded until this point!

 require 'capybara/rspec'

 

 # Checks for pending migration and applies them before tests are run.

 # If you are not using ActiveRecord, you can remove this line.

 ActiveRecord::Migration.maintain_test_schema!

 

 RSpec.configure do |config|

 

   # The different available types are documented in the features, such as in

   # https://relishapp.com/rspec/rspec-rails/docs

   config.infer_spec_type_from_file_location!

 

   # Filter lines from Rails gems in backtraces.

   config.filter_rails_from_backtrace!

   # arbitrary gems may also be filtered via:

   # config.filter_gems_from_backtrace("gem name")

 end
