class TodoItemsController < ApplicationController
  before_filter :get_project
  before_filter :get_resources

  def new
    @todo_item = @todo_list.todo_items.new
  end

  def create
    @todo_item = @todo_list.todo_items.new(params[:todo_item])
    @todo_item.save!
    flash[:notice] = 'Zapisano zdarzenie'
    redirect_to project_milestone_todo_list_path(@project.id, @milestone.id, @todo_list.id)
  rescue
    flash[:error] = 'Wystąpił błąd'
    render :action => :new
  end

protected
  def get_resources
    @users = User.all #temporary
    @milestone = @project.milestones.find(params[:milestone_id])
    @todo_list = @milestone.todo_lists.find(params[:todo_list_id])
  end

end
