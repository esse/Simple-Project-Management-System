class Milestone < ActiveRecord::Base
  include Workflow
  belongs_to :user
  belongs_to :project
  has_many :todo_lists
  has_many :uploaded_files, :as => :container
  validates_presence_of :name

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
