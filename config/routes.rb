Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'sessions#welcome'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#logout'
  post '/logout' => 'sessions#destroy'

  get '/users/witchers' => 'users#witchers'

  resources :users, only: [:new, :show, :create]

  resources :contracts 

  resources :monsters do
    resources :weaknesses, only: [:new, :create]
    resources :users, only: [:index]
  end

  resources :weaknesses 

  resources :types, only: [:show, :index] do
    resources :monsters, only: [:new, :index, :create, :show]
  end
  
  resources :locations, only: [:index]

  get '/auth/:provider/callback' => 'sessions#omniauth'

  #get '*path', to: action#controller 

  get '*path' => 'sessions#welcome'

end
