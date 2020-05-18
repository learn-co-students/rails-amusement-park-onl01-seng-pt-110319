Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new,:show, :create]
  resources :attractions, only:[:new,:show,:create,:edit,:index, :update]
  root 'application#home'
  get '/signin' => 'users#login'
  post '/create' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post '/attractions/:id'  => 'rides#new'
end
