class TodoItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :todo_list
  include Workflow  
  workflow do
    state :new do
      event :accept, :transitions_to => :in_progress do
      end
      event :invalid, :transitions_to => :invalid do
      end
    end

    state :in_progress do
      event :finish, :transitions_to => :finished do
      end
      event :invalid, :transitions_to => :invalid do
      end
    end

    state :finished do
      event :new, :transitions_to => :new do
      end
      event :invalid, :transitions_to => :invalid do
      end
    end

    state :invalid do
      event :new, :transitions_to => :new do
      end
    end
  end
  
end
