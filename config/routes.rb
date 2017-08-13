Rails.application.routes.draw do
  root 'welcome#index'

  get 'committees/:state', to: 'committees#index', as: 'committees'
  get 'committee/:id', to: 'committees#show', as: 'committee'

  get 'legislators/:state', to: 'legislators#index', as: 'legislators'
  get 'legislator/:id', to: 'legislators#show', as: 'legislator'

  get 'bills/:state', to: 'bills#index', as: 'bills'
  get 'bill/:id', to: 'bills#show', as: 'bill'

  get 'states', to: 'states#index', as: 'states'
  get 'state/', to: 'states#show', as: 'state_search'
  get 'state/:state', to: 'states#show', as: 'state'
end
