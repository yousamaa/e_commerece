Rails.application.routes.draw do
  resources :products do
    resources :comments
  end
  devise_for :users
  root to: 'home#index'
end
