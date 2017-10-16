Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users

  resources :users, only: [:show]

  resources :events do
    resources :registrations, only: [:create]
  end

  resources :categories
  resources :profiles, only: [:new, :edit, :create, :update]

  get "about" => "pages#about"

  resources :photos

  namespace :api do
    resources :events
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
