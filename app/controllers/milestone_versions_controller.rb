class MilestoneVersionsController < ApplicationController
  before_filter :get_project
  deny :user => :is_guest?
  allow :user => :is_authorized?, :object => :project
  def index
    @milestone = Milestone.find(params[:milestone_id])
  end

  def show
    @milestone = Milestone.find(params[:milestone_id]).versions.find_by_version(params[:id])
  end
end
