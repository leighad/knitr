Rails.application.routes.draw do

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  # use this if you want to keep URL as '/signup' upon re-render after user fails to signup
  
  resources :comments
  resources :patterns
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
