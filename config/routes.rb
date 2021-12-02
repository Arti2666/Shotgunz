Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
  get 'lists/index'
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }

  resources :lists, only: %I[index show new create destroy] do
    resources :shotguns, only: %I[create destroy]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
