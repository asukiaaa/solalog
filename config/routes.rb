Rails.application.routes.draw do

  root 'static#about'

  get 'login',  to: 'session#new',     as: :login
  get 'logout', to: 'session#destroy', as: :logout

  resource :session do
    get :oauth_facebook
  end
  resource :contact, only: [:new, :create]
  resources :plants, only: [:index, :show]

  # for static pages
  resource :static, only: [] do
    get :about
  end

  namespace :private do
    resource :dashboard, only: :show
    resources :plants
    # playt has params: apikey, name
    # plant has many owner, power_logs
  end

  namespace :api do
    resource :power_log, only: :create
  end

end
