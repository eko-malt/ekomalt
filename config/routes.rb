Rails.application.routes.draw do
  root to: 'pages#main'

  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'

  get '/storage_raw',  to: 'pages#storageraw'
  get '/old_maltose',  to: 'pages#oldmaltose'
  get '/new_maltose',  to: 'pages#newmaltose'
  get '/storage_malt', to: 'pages#storagemalt'
  get '/inputs',       to: 'inputs#index'
  get '/settings',     to: 'settings#index'

  resources :providers
  resources :malts
  resources :equipment, only: %i[edit update]
  resources :settings, only: :update
  resources :bag_inputs
  resources :grain_inputs

  resources :raw_processes, only: %i[new show create edit update destroy] do
    member do
      put :status_update
    end
  end

  resources :movements, only: %i[create edit update destroy]
  resources :malt_settings, only: %i[edit update]
  resources :grain_batches, only: %i[new create edit update destroy]
  resources :bag_batches, only: %i[new create show edit update destroy]
  resources :clients
  resources :orders do
    member do
      put :status_update
    end
  end
  resources :order_items, only: %i[new create edit update destroy]
end
