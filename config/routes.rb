Rails.application.routes.draw do

  root to: 'pages#main'
  get '/storage_raw', to: 'pages#storageraw'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/inputs', to: 'inputs#index'
  get 'inputs/new'

  resource :sessions, only: %i[new create destroy]
  resources :providers
  resources :bag_inputs, only: %i[show edit update create destroy]
  resources :grain_inputs, only: %i[show edit update create destroy]
end
