class DashboardController < ApplicationController
  before_filter :get_resource
  deny :user => :is_guest?
  allow :user => :is_authorized?, :object => :project
  def index
    redirect_to project_path(@project.id)
  end

protected

  def get_resource
    @project = Project.find_by_name(params[:project_name])
  end
end
