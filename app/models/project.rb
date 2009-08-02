class Project < ActiveRecord::Base
  has_many :milestones
  has_many :todo_lists
  has_many :writeboards
  has_many :users, :through => :permissions
  has_many :permissions
  has_many :user_reports
  validates_uniqueness_of :name
  has_many :uploaded_files, :as => :container
  include Workflow
  workflow do
    state :active do
      event :finish, :transitions_to => :finished do
      end
    end
    state :finished do
      event :finish, :transitions_to => :active do
      end
    end
  end

end
