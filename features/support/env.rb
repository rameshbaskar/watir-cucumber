require 'rubygems'
require 'active_support/all'
require 'active_record'
require 'watir-webdriver'
require 'faker'
require 'factory_girl'
require 'fileutils'
require 'pry'
require 'pry-nav'

# Load the test manager
require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "config", "test_manager.rb"))
TestManager.initialize

# Load the database configuration
require File.join(TestManager.root_folder, "config", "database.rb")

# Load the database models
Dir.glob(File.join(TestManager.models_dir, "**", "*.rb")).each do |file|
  require file
end

# Load the utilities
Dir.glob(File.join(TestManager.utils_dir, "**", "*.rb")).each do |file|
  require file
end

include CommonUtils
include Verifier
include PageHelper

# Set the default browser session
puts "Setting default browser session..."
Browser.set_context_as Browser::DEFAULT_SESSION_KEY

# Load the page modules
require File.join(TestManager.root_folder, "pages", "base_page.rb")
Dir.glob(File.join(TestManager.pages_dir, "**", "*.rb")).each do |file|
  require file
end
