Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'connect_item', to: 'services#connect_item', as: :connect_item
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
