Rails.application.routes.draw do
  resources :houses do
    resource :favorites, only: [:create, :destroy]
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
