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
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'config', 'test_manager.rb'))
include TestManager
prepare_results_dir

# Load the utilities
Dir.glob(File.join(utils_dir, '**', '*.rb')).each do |file|
  require file
end
include CommonUtils
include Verifier
include PageHelper

# Set the default browser session
puts 'Creating a default browser session...'
Browser.set_current_session_as 'default_session'

# Load the page modules
Dir.glob(File.join(pages_dir, '**', '*.rb')).each do |file|
  require file
end
