Rails.application.routes.draw do

  root "main_menu#index"

  resources :main_menu

  resources :products

    #get 'export_users' => 'exports#export_users', as: :export_users

  get 'progress_products/:job_id' => 'products#progress_job'

   get 'progress-job/:job_id' => 'progress_job/progress#show'

  get 'download_products' => 'products#download_csv', as: :download_csv

  post '/delete_all_products', to: 'products#delete_all_products', as: :delete_all_products

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]


end
