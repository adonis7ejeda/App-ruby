Rails.application.routes.draw do
  root to: 'home#index'
  resources :books, except: [:show]
  resources :users
  resources :loans, except: [:show]
  resources :fines, except: [:show]
end
