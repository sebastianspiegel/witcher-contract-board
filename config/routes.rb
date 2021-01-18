Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root '/' => 'sessions#welcome'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :show, :create]

  resources :contracts 

  resources :monsters, only: [:show, :index]
  resources :types, only: [:show, :index]

end
