Rails.application.routes.draw do

  root 'doc#about'

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

  resource :doc, only: [] do
    get :about
  end

  namespace :private do
    resource :dashboard, only: :show, controller: 'dashboard'
    resources :plants do
      resources :power_logs, only: :destroy
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :power_log, only: :create, controller: 'power_log'
      resources :plants, only: [:index, :show]
    end
  end

end
