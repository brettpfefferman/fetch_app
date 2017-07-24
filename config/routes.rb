Rails.application.routes.draw do

  root'home#index'
  
  resources :users, only: [:new, :create, :update]
  get '/users/settings', to: 'users#edit'
  resources :sessions, only: [:new, :create, :destroy]

  get '/dogs', to: 'dogs#index'
  get '/dogs/new', to: 'dogs#new'
  get '/dogs/:id', to: 'dogs#show'
  get '/dogs/:id/edit', to: 'dogs#edit'
  post '/dogs', to: 'dogs#create'
  patch '/dogs/:id', to: 'dogs#update', as: 'dog'

  get '/home', to: 'home#index'
  get '/about', to: 'home#about'
  get '/stories', to: 'home#stories'



  get '/login', to: 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
