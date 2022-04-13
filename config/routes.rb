Rails.application.routes.draw do
  get 'contacts/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
 root "posts#index"
  #get 'projects/index'
	resources :posts

	match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
	get '/auth/:provider/callback', :to => 'sessions#create'
	# get '/auth/:provider', :to => 'sessions#create'
  # match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes
  resources :contacts
end
