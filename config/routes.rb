Rails.application.routes.draw do
  root to: 'static#index'
  get '/cfp', to: 'static#cfp', as: 'cfp'
  get '/nominate', to: 'static#nominate', as: 'nominate'
  get '/tickets', to: 'static#tickets', as: 'tickets'
end
