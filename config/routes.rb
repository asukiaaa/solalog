Rails.application.routes.draw do

  root 'static#about'

  get 'login',  to: 'session#new',     as: :login
  get 'logout', to: 'session#destroy', as: :logout
  get '/auth/:provider/callback', to: 'session#oauth_callback', as: :oauth_callback
  get '/auth/failure',            to: 'session#oauth_failure',  as: :oauth_failure

  resource :session do
    get :oauth_callback
    get :oauth_failure
  end
  resource :contact, only: [:new, :create]
  resources :plants, only: [:index, :show]

  # for static pages
  resource :static, only: [] do
    get :about
  end

  namespace :private do
    resource :dashboard, only: :show, controller: 'dashboard'
    resources :plants
    # playt has params: apikey, name
    # plant has many owner, power_logs
  end

  namespace :api do
    resource :power_log, only: :create
  end

end
