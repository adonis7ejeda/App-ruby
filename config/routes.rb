Rails.application.routes.draw do
  root to: 'home#index'
  resources :books, except: [:show]
  resources :users
end
