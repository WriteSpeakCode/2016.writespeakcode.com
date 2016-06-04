Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :people, only: [:index]
  get 'speakers', to: 'people#speakers'

  resources :talks, only: [:index]


  root to: 'static#index'

  get ':action', controller: 'static'
end
