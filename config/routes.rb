Rails.application.routes.draw do

  root 'application#home'

  resources :attractions
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/rides/new' => 'rides#new'



end
