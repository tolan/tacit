Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :subscriptions, only: [ :index, :show ]

get "subscriptions", to: "subscriptions#index"
get "subscriptions/:id", to: "subscriptions#show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
