Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions" }

  resources :posts do 
    resources :likes, only: :create
  end

  resources :dashboards, only: :index do 
    collection do 
      get :currently_loggedin
      get :post_likes
    end
  end

  # devise_for :users
  root to: 'home#index'
end
