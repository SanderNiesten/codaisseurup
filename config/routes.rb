Rails.application.routes.draw do
  resources :categories
  root 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :events
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos
  get "about" => "pages#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
