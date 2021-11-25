Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get 'lists/index'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :lists, only: %I[index show new create destroy] do
    resources :shotguns, only: %I[create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
