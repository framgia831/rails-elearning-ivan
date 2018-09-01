Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/dashboard', to: 'static_pages#dashboard'

  resources :users
  resources :relationships
  resources :categories, only: [:index]

  resources :lessons, only: [:create, :show] do 
    resources :answers
  end
  
  namespace :admin do
    resources :categories do
      resources :words
    end
  end

  root 'static_pages#home'
end
