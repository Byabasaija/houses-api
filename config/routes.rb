Rails.application.routes.draw do
  resources :sessions, only: [:create, :show, :destroy]
  resources :registrations, only: [:create]
  resources :houses 
   
  resources :favorites, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
