Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users 
  get 'lead_generators', to: 'users#lead_generators'	
  resources :leads
  resources :email_templates
  get 'send_email', to: 'email_templates#send_email'	

  # Admin routes  
	namespace :admin do
  	  get 'list_users', to: "users#list_users"
  	  post 'assign_manager', to: "users#assign_manager"
	end

end
