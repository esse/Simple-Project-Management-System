class TodoItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :todo_list
  acts_as_versioned
  
  include Workflow
  workflow do
    state :waiting do
      event :confirm, :transitions_to => :confirmed do
      end
    end
    state :confirmed do
      event :cancel, :transitions_to => :cancelled do
      end
    end

    state :cancelled do
      event :confirm, :transitions_to => :confirmed do

      end
    end

  end
end
