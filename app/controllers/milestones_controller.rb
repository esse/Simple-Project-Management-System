class MilestonesController < ApplicationController
  before_filter :get_project

  def index
    @milestones = @project.milestones
  end

  def new
    @milestone = Milestone.new
  end

  def create
    @milestone = Milestone.new(params[:milestone].merge(:project_id => @project.id, :user_id => @user.id))
    @milestone.save!
    flash[:notice] = 'Zapisano punkt przełomowy'
    redirect_to project_milestones_path(@project.id)
  rescue
    flash[:error] = 'Wystąpił błąd'
    render :action => :new
  end

  def show
    @milestone = @project.milestones.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy
    
  end

end
