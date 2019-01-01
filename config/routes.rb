Rails.application.routes.draw do
    root 'homes#index'
    get '/users/dashboard', to: 'users#dashboard'
    get '/users/profile', to: 'users#profile'
    resources :cards, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :transactions, only: [:index, :show, :new, :create]
    resources :users, only: [:index, :show, :new, :create, :update]
    resources :sessions, only: [:new, :create, :destroy]
  	resources :relations, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
