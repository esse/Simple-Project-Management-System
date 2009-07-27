require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  should_belong_to :user, :todo_list
end
