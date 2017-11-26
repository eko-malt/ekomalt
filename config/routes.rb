Rails.application.routes.draw do
  get 'inputs/new'

  root to: 'application#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resource :sessions, only: %i[new create destroy]
  resources :providers
  resources :inputs
end
