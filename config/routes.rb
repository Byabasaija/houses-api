Rails.application.routes.draw do

  resources :houses, only: [:index, :create, :show] 
   
  resources :favorites, only: [:index, :create]
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'users#new'
  # resources :users, only: []
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
