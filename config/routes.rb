ActionController::Routing::Routes.draw do |map|
  map.resources :projects, :members => { :state => :put } do |project|
    project.resources :permissions
    project.resources :milestones, :members => { :state => :put } do |mile|
      mile.resources :todo_lists, :members => { :state => :put } do |todo|
        todo.resources :todo_items, :members => { :state => :put }
      end
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
