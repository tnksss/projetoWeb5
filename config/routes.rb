Rails.application.routes.draw do

  get 'auctions/index'

  get 'auctions/show'

  devise_for :admins
  devise_for :users
  root to: 'home#index' do
    root to:  'chats#show'
  end
get 'chats/show'
  mount ActionCable.server => '/cable' 

    
  resources :home
  resources :launches
  post 'add_launches', to: "launches#add_new_launch"
  get 'add_launches', to: 'launches#add_launch' 
  
  
  resources :contacts, only: [:create, :index]
  resources :products, only: [:index,  :show]
  resources :auctions, only: [:index,  :show]
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
        get 'add_products',     to: 'auctions#add_products' 
        post 'add_product',     to: "auctions#add_new_product"       
        post 'delete_product',  to: "auctions#delete_product"
      
      end
    end
  end
   
end
