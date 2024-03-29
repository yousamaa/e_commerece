# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'products#index'

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  post 'checkout/create' => 'checkout#create', as: 'checkout_create'

  post 'cart_items' => 'cart_items#create'
  get 'cart_items/:id' => 'cart_items#show', as: 'cart_item'
  delete 'cart_items/:id' => 'cart_items#destroy'

  get 'checkout_success', to: 'checkout#checkout_success'

  resources :products do
    resources :comments
    collection do
      match 'search' => 'products#search', via: %i[get post], as: :search
    end
  end

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
    end
  end

  get '*path' => redirect('/')
end
