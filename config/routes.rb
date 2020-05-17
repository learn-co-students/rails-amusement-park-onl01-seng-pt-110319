Rails.application.routes.draw do
  get 'attractions/index'
  get 'attractions/create'
  get 'attractions/new'
  get 'attractions/edit'
  get 'attractions/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new,:show, :create]
  resources :attractions, only:[:new,:show,:create,:edit,:index]
  root 'application#home'
  get '/signin' => 'users#login'
  post '/create' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
