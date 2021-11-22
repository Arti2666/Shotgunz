Rails.application.routes.draw do
  get 'lists/index'
  devise_for :users
  root to: 'pages#home'
  resources :lists, only: %I[index show new create delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
