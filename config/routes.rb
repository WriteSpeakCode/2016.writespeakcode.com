Rails.application.routes.draw do
  root to: 'static#index'
  get ':action', to: 'static'
end
