Rails.application.routes.draw do
  root 'welcome#index'

  get 'committees', to: 'committees#index', as: 'committees'
  get 'committee/:id', to: 'committees#show', as: 'committee'
end
