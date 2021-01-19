Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'sessions#welcome'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#logout'
  post '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :show, :create]

  resources :contracts 

  resources :monsters 
  resources :types, only: [:show, :index]

end
