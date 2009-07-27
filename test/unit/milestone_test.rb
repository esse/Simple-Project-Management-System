require File.dirname(__FILE__) + '/../test_helper'

class MilestoneTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  should_belong_to :user
  should_belong_to :project


end
