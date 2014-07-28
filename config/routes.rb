Rails.application.routes.draw do
	# Users
	devise_for :users

	# Rails Admin routes engine
	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

	# Rails User created controllers
	resources :posts do
		resources :comments
	end

	# Years
	get 'year/:id', to: 'posts#year', as: 'year'

	# Root
	root 'posts#index'
end