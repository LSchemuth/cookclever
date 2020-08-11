Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/supermarkets/:id/dashboard', to: 'supermarkets#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes, except: [ :new, :create ] do
    resources :orders, only: [ :new, :create ]
    resources :amounts, only: [ :new, :create ]
  end

  resources :orders, only: [ :destroy ]
  resources :amounts, only: :destroy

  resources :baskets, only: [ :show ]

  resources :supermarkets do
    resources :recipes, only: [ :new, :create ]
    resources :ingredients
  end

end
