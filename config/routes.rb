Ninjas::Application.routes.draw do

  root to: 'ninjas#index'

  get '/search', as: :search, to: 'static_pages#search'

  resource :session, only: [:new, :create, :destroy]
  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'

  resources :ninjas, only: [:index, :new, :create, :show] do
    resources :targets, only: [:create, :update, :destroy]
  end

  namespace :api, defaults: {format: :json} do
    get '/search', as: :search, to: 'static_pages#search'
    resources :ninjas, only: [:index, :new, :create] do
      resources :targets, only: [:create, :update, :destroy]
    end
  end

end
