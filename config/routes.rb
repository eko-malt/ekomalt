Rails.application.routes.draw do
  root to: 'application#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resource :sessions, only: %i[new create destroy]
  resources :providers
end
