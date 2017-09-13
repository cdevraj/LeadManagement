Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users 
  get 'lead_generators', to: 'users#lead_generators'	

  resources :leads
  post 'change_lead_owner', to: 'leads#change_lead_owner' 

  resources :email_templates
  post 'send_email', to: 'email_templates#send_email'	
  get 'compose_email', to: 'email_templates#compose_email'  

  # Admin routes  
	namespace :admin do
  	  get 'list_users', to: "users#list_users"
  	  post 'assign_manager', to: "users#assign_manager"
	end

  # Chat history
  get 'chat_history', to: 'email_conversations#chat_history'  
  get 'scheduled_emails', to: 'email_conversations#scheduled_emails'  
  post 'add_notes', to: 'email_conversations#add_notes'  

end
