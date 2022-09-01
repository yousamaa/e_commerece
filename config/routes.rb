Rails.application.routes.draw do
  post 'checkout/create' => 'checkout#create', as: "checkout_create"
  resources :products do
    resources :comments
  end
  devise_for :users
  root to: 'home#index'
end
