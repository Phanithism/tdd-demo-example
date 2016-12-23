Rails.application.routes.draw do
  resources :posts

  get 'airport_lookup', to: 'airport_lookup#index', as: 'airport_lookup'

end
