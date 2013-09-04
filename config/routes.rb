Spsfilm::Application.routes.draw do

  	get "password_resets/new"
  	
  	get "login", :to => "users#login", :as => "login"
  	post "login", :to => "users#login_do", :as => "do_login"
  	get "logout", :to => "users#logout", :as => "logout"
  	get "signup", :to => "users#new", :as => "signup"
  	
  	resources :users
  	resources :password_resets
  	get "account", :to => "users#edit", :as => "account"
  	
  	resources :requests
  	resources :packages
  	resources :gear
	
	root :to => 'pages#index'

end
