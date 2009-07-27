RAILS_ENV = 'test'
require File.expand_path(File.join(File.dirname(__FILE__), '../../../../config/environment.rb'))
require 'test/unit'
require 'test_help'

# load test schema
load(File.dirname(__FILE__) + "/schema.rb")

require File.join(File.dirname(__FILE__), 'models/user')