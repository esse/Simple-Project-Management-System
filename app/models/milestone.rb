class Milestone < ActiveRecord::Base
  include Workflow
  belongs_to :user
  belongs_to :project
  has_many :todo_lists
  has_many :uploaded_files, :as => :container
  validates_presence_of :name
  #accepts_nested_attributes_for :todo_list

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
