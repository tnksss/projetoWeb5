Rails.application.routes.draw do
root to: 'home#index'
  get 'auctions/index'

  get 'auctions/show'

  devise_for :admins
  devise_for :users
authenticate :admin do
  root to: 'home#index' do
   
  end
end  
authenticate :admin do
  resources :messages
end  
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
