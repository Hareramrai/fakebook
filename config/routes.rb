Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions" }

  resources :posts do 
    resources :likes, only: :create
  end

  # devise_for :users
  root to: 'home#index'
end
