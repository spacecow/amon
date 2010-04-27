ActionController::Routing::Routes.draw do |map|
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.resources :sessions
  
  map.admin_login 'admin/login', :controller => 'admin', :action => 'login'
  map.admin_logout 'admin/logout', :controller => 'admin', :action => 'logout'
  
  map.resources :messages
  map.resources :users
  map.resources :pages
  map.namespace :admin do |admin|
		admin.resources :users
		admin.resources :pages
		admin.resources :messages, :collection=>{ :bajs=>:get }
	end
	
	map.view_page ':name', :controller=>'pages', :action=>'show'
	  
  map.root :controller=>'pages', :action=>'show', :name=>'home'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
