Ninjas::Application.routes.draw do

  root to: 'sessions#new'

  resource :session, only: [:new, :create, :destroy]

  resources :ninjas, only: [:index, :new, :create]

  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'

end
