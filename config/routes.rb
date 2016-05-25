Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :speakers, only: [:index]

  root to: 'static#index'
  get ':action', controller: 'static'
end
