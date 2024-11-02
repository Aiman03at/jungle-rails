Rails.application.routes.draw do
  root to: 'products#index'

  resources :registrations, only: [:new, :create]  # For Sign Up
  resources :sessions, only: [:new, :create, :destroy]  # For Log In/Out

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post :add_item
    post :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]  # Admin categories
  end

  # Adding this line for the About page
  get 'about', to: 'about#index'
end