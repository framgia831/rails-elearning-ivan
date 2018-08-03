Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users do 
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  root 'static_pages#home'
end
