Rails.application.routes.draw do

  root 'static#about'

  get 'signin',  to: 'sessions#new',     as: :signin
  get 'signout', to: 'sessions#destroy', as: :signout
  get 'signup',  to: 'user#new',        as: :signup

  resources :sessions
  resources :password_resets
  resource :user, only: [:new, :create]
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
    resource :power_record, only: :post
  end

end
