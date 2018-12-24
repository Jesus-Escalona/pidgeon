Rails.application.routes.draw do
    root 'homes#index'
    resources :cards
    resources :transactions
    resources :users
    resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
