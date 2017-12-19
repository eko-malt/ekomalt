Rails.application.routes.draw do
  root to: 'pages#main'

  get '/storage_raw', to: 'pages#storageraw'
  get '/old_maltose', to: 'pages#oldmaltose'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/inputs', to: 'inputs#index'
  get 'inputs/new'

  get '/settings', to: 'settings#index'

  resources :providers
  resources :malts
  resources :equipment, only: %i[edit update]
  resources :settings, only: :update
  resources :bag_inputs
  resources :grain_inputs
end
