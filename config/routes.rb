Rails.application.routes.draw do
  root to: 'pages#main'

  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'

  get '/storage_raw', to: 'pages#storageraw'
  get '/old_maltose', to: 'pages#oldmaltose'
  get '/new_maltose', to: 'pages#newmaltose'
  get '/inputs',      to: 'inputs#index'
  get '/settings',    to: 'settings#index'

  resources :providers
  resources :malts
  resources :equipment, only: %i[edit update]
  resources :settings, only: :update
  resources :bag_inputs
  resources :grain_inputs
  resources :raw_processes, only: %i[new show create edit update destroy]
  put '/raw_processes/update/:id', to: 'raw_processes#status_update'
  resources :movements, only: %i[create edit update destroy]
  resources :malt_settings, only: %i[edit update]
end
