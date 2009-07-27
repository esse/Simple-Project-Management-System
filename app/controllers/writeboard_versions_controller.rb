class WriteboardVersionsController < ApplicationController
  before_filter :get_project
  deny :user => :is_guest?
  allow :user => :is_authorized?, :object => :project
  def index
    @writeboard = Writeboard.find(params[:writeboard_id])
  end

  def show
    @writeboard = Writeboard.find(params[:writeboard_id]).versions.find_by_version(params[:id])
  end
end
