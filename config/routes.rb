Rails.application.routes.draw do
  get 'inputs/new'

  root to: 'application#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/inputs', to: 'inputs#index'
  resource :sessions, only: %i[new create destroy]
  resources :providers
  resources :bag_inputs, only: %i[show edit create destroy]
  resources :grain_inputs, only: %i[show edit create destroy]
end
