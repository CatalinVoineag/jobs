Rails.application.routes.draw do

  root "products#index"

  resources :products

  post '/delete_all_products', to: 'products#delete_all_products', as: :delete_all_products

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]


end
