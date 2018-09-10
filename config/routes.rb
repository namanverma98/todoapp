Rails.application.routes.draw do
  root to: 'tasks#index'
  devise_for :users
  resources :users
  resources :tasks do
  	collection do
  		patch :sort
  		post :mark_as_complete
  	end
  end

end
