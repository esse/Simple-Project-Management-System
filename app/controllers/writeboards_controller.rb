class WriteboardsController < ApplicationController
  before_filter :get_project
  deny :user => :is_guest?
  allow :user => :is_authorized?, :object => :project
  def index
    @writeboards = Writeboard.find_all_by_project_id(params[:project_id])
  end

  def new
    @writeboard = Writeboard.new
  end

  def show
    @writeboard = Writeboard.find_by_project_id_and_id(@project.id, params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @writeboard = Writeboard.new(params[:writeboard].merge(:project_id => @project.id, :user_id => @user.id))
    @writeboard.save!
    flash[:notice] = 'Zapisano tablicę'
    redirect_to project_writeboards_path(@project.id)
  rescue
    flash[:error] = 'Wystąpił błąd'
    render :action => :new
  end

  def edit
    @writeboard = Writeboard.find_by_project_id_and_id(@project.id, params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @writeboard = Writeboard.find_by_project_id_and_id(@project.id, params[:id])
    @writeboard.title = params[:writeboard][:title]
    @writeboard.content = params[:writeboard][:content]
    @writeboard.user_id = @user.id
    @writeboard.save!
    flash[:notice] = 'Zapisano tablicę'
    redirect_to project_writeboards_path(@project.id)
  rescue
    flash[:error] = 'Wystąpił błąd'
    render :action => :edit
  end

  def destroy
    
  end
  
end
