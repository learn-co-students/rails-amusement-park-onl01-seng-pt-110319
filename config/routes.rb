Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new,:show, :create]
  root 'application#home'
  get 'logout' => 'sessions#destroy'
end
