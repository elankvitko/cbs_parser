Rails.application.routes.draw do
  root 'home#index'
  resources :players, only: [ :show ]
  resources :sports, only: [ :show ]
end
