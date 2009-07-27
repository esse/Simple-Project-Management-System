class User < ActiveRecord::Base
  acts_as_authentic
  has_many :milestones
  has_many :projects, :through => :permissions
  has_many :todo_items
  has_many :permissions
  has_many :user_reports
 
  def is_guest?
    self.class == User::Guest
  end

  def is_admin?
    self.admin == true
  end

  def is_authorized?(project)
    self.projects.include? project
  end

end
