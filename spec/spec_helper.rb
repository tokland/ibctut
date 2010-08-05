# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)
require 'spec/autorun'
require 'spec/rails'
require 'remarkable_rails'
require 'remarkable_paperclip'
require 'factory_girl'

require 'webrat'
require 'webrat/rspec-rails'
Webrat.configure do |config|
  config.mode = :rails
end 

%w{factories}.each do |name|
  require File.expand_path(File.dirname(__FILE__) + '/' + name)
end

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
end
