Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
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

  resources :ordered_amounts do
    member do
      patch :increment
      patch :decrement
    end
  end

  resources :confirmation_pages, only: [ :show ]

end
