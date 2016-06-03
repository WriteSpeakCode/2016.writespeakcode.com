Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # resources :speakers, only: [:index]

  resources :people, only: [:index]

  resources :talks, only: [:index]

  get 'people/speakers', to: 'people#speakers'

  root to: 'static#index'

  get ':action', controller: 'static'
end
