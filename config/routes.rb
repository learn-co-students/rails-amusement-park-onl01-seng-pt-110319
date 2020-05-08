Rails.application.routes.draw do
  resources :attractions 
  resources :users
  resources :rides, only: [:create]
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  get '/logout' => "sessions#destroy"
  delete '/logout' => "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
end
