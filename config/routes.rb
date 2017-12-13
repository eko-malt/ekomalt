Rails.application.routes.draw do

  root to: 'pages#main'
  get '/storage_raw', to: 'pages#storageraw'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/inputs', to: 'inputs#index'
  get 'inputs/new'

  get '/settings', to: 'settings#index'
  #patch '/settings', to: 'settings#update'

  resource :sessions, only: %i[new create destroy]
  resources :providers
  resources :settings, only: :update
  resources :bag_inputs, only: %i[show edit update create destroy]
  resources :grain_inputs, only: %i[show edit update create destroy]
end
