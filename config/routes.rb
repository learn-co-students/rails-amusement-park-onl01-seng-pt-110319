Rails.application.routes.draw do
  
  root 'users#home'

  resources :users
  resources :attractions
  resources :rides 

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

end
