class ProductsController < ApplicationController
    
    def index
        @products = Product.all
    end

	def show
		
        @product = Product.find(params[:id]) 
        @messages = Message.all
     	@launches = Launch.all
     	@uls = UserLaunch.all
        @user = User.find(params[:id]) 
         @launch = Launch.new
         @chats = Message.new
        @auctions = Auction.all
        @products = Product.all
    end  
end
 