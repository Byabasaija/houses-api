Rails.application.routes.draw do

  resources :houses 
   
  resources :favorites, only: [:create]
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'users#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
