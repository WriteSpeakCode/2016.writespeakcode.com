Rails.application.routes.draw do
  root to: 'static#index'
  resources :speakers, only: [:index]

  get ':action', to: 'static'
end
