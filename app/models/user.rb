class User < ActiveRecord::Base
  acts_as_authentic
  has_many :milestones
  has_many :projects, :through => :permissions
  has_many :todo_items
  has_many :permissions
  has_many :user_reports
  has_many :uploaded_files, :as => :container
  def is_guest?
    self.class == User::Guest
  end

  def is_admin?
    self.admin == true
  end

  def is_authorized?(project)
    self.projects.include? project
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

end
