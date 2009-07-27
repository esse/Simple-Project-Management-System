class TodoList < ActiveRecord::Base
  belongs_to :project
  belongs_to :milestone
  has_many :todo_items
  acts_as_versioned

  has_many :uploaded_files, :as => :container
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
