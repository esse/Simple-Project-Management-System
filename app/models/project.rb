class Project < ActiveRecord::Base
  has_many :milestones
  has_many :todo_lists
  has_many :writeboards
  has_many :users, :through => :permissions
  has_many :permissions
  has_many :user_reports
  validates_uniqueness_of :name
end
