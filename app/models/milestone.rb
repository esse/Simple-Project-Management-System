class Milestone < ActiveRecord::Base
  include Workflow
  belongs_to :user
  belongs_to :project
  has_many :todo_lists
  acts_as_versioned


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
