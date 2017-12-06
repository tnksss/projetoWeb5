Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  resources :home
  devise_for :users
  resources :contacts, only: [:create, :index]
  resources :products, only: [:index,  :show]
  authenticate :user do
    namespace :users do
      root to: 'dashboard#index'
    end
  end

  authenticate :admin do
    namespace :admins do
      root to: 'dashboard#index'      
      resources :products
      resources :auctions do
        get 'add_products', to: 'auctions#add_products'
      end
    end
  end
   
end
