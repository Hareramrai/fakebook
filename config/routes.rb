Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions" }

  resources :posts

  # devise_for :users
  root to: 'home#index'
end
