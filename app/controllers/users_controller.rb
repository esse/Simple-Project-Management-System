class UsersController < ApplicationController
  deny :user => :is_guest?, :except => [:new, :create]
  allow :user => :is_admin?, :only => :index
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user_temp = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user_temp = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user_temp = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user_temp = User.new(params[:user])
    if @user_temp.save
      flash[:notice] = 'Rejestracja poprawna.'
      redirect_to root_url
    else
      render :action => "new"
    end  
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user_temp = User.find(params[:id])

    respond_to do |format|
      if @user_temp.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user_temp) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_temp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user_temp = User.find(params[:id])
    @user_temp.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
