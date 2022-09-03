# frozen_string_literal: true

Rails.application.routes.draw do
  post 'checkout/create' => 'checkout#create', as: 'checkout_create'
  post 'cart_itms/create' => 'cart_items#create', as: 'add_to_cart'
  get 'cart_items/destroy' => 'cart_items#destroy', as: 'remove_from_cart'
  resources :carts
  resources :products do
    resources :comments
  end
  devise_for :users
  root to: 'home#index'
end
