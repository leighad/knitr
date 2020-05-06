Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  # use this if you want to keep URL as '/signup' upon re-render after user fails to signup
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :comments
  resources :patterns
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
