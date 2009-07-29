class MilestonesController < ApplicationController
  before_filter :get_project
  deny :user => :is_guest?
  allow :user => :is_authorized?, :object => :project
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
    @milestone = @project.milestones.find(params[:id])
  end

  def update
    @milestone = @project.milestones.find(params[:id])
    @milestone.update_attributes!(params[:milestone].merge(:project_id => @project.id, :user_id => @user.id))
    flash[:notice] = 'Uaktualniono punkt przełomowy'
    redirect_to project_milestones_path(@project.id)
  rescue
    flash[:error] = 'Wystąpił błąd'
    render :action => :edit
  end

  def destroy
    @milestone = @project.milestones.find(params[:id])
    @milestone.destroy!
    flash[:notice] = 'Usunięto punkt przełomowy'
    redirect_to project_milestones_path(@milestone.project)
  rescue
    flash[:error] = 'Wystąpił błąd'
    redirect_to project_milestone_path(@milestone.project.id, @milestone.id)
  end

end
