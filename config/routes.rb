Rails.application.routes.draw do
  resources :orders
  resources :creators
  resources :product_sizes
  resources :variants
  resources :products
  resources :stocks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
