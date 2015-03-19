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
Dir.glob(File.join(utils_dir, '*.rb')).each do |file|
  require file
end
include CommonUtils
include Verifier

# Initialize the pages
require File.join(root_folder, 'page_helper.rb')
