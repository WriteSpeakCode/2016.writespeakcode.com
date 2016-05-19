Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :speakers, only: [:index]

  resources :people, only: [:index]

  root to: 'splash#index'

  get ':action', controller: 'static'
end
