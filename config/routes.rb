Rails.application.routes.draw do
  root to: 'home#index'
  resources :books
  resources :users
end
