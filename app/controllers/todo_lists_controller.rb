class TodoListsController < ApplicationController
  before_filter :get_project
  before_filter :get_milestone

  def index
    @todo_lists = @milestone.todo_lists
  end


  def show
    @todo_list = @milestone.todo_lists.find(params[:id])
  end

  def new
    @todo_list= @milestone.todo_lists.new
  end


  def create
    @todo_list = @milestone.todo_lists.new(params[:todo_list].merge(:project_id => @project.id, :milestone_id => @milestone.id))
    @todo_list.save!
    flash[:notice] = 'Zapisano listę zadań'
    redirect_to project_milestone_todo_list_path(@project.id, @milestone.id, @todo_list.id)
  rescue
    flash[:error] = 'Wystąpił błąd'
    render :action => :new
  end

protected

  def get_milestone
    @milestone = @project.milestones.find(params[:milestone_id])
  end 

end
