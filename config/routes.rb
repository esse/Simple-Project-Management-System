ActionController::Routing::Routes.draw do |map|
  map.resources :projects do |project|
    project.resources :permissions
    project.resources :milestones do |mile|
      mile.resources :milestone_versions
      mile.resources :todo_lists
    end
    project.resources :writeboards do |write|
      write.resources :writeboard_versions
    end
  end

  map.login "login", :controller => 'user_sessions', :action => 'new'
  map.logout "logout", :controller => 'user_sessions', :action => 'destroy'

  map.root :controller => 'index', :action => 'index'
  map.resources :user_sessions
  map.resources :users
  map.resources :password_resets
  map.dashboard '/:project_name', :controller => 'dashboard', :action => 'index'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
