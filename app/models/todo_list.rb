class TodoList < ActiveRecord::Base
  belongs_to :project
  belongs_to :milestone
  has_many :todo_items

  has_many :uploaded_files, :as => :container
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
