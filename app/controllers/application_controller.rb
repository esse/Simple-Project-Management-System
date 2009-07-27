# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :set_user
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
protected
  def set_user
    @user = current_user
  end
private
 def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    if current_user_session
      @current_user = current_user_session && current_user_session.record
    else
      @current_user = User::Guest.new
    end
  end

  def get_project
    @project = Project.find(params[:project_id])
  end

end
