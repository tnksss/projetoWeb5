class HomeController < ApplicationController
  helper_method :current_user

def current_user=(user)
  @current_user = user
end
  def index
   x = Product.maximum("price")

   @launches = Launch.all
   @uls = UserLaunch.all
    @launch = Launch.new
    @users = User.all
    @auctions = Auction.all
    @products = Product.all
    
  end
  def create
   
  end
  def add_launch
    @auction = Auction.find(params[:auction_id])
    @products = Product.all.unscoped.order("id")

  end 

 def add_new_launch
  @product = Product.find(params[:product_id])
  @auction = Auction.find(params[:auction_id])
  @auction.product_ids << params[:product_id] 
  params = acp
  par = pp
  params[:product_ids] =  @auction.product_ids 
  par[:flag] = false
  @product.update_attributes(par)
  @auction.update_attributes(params)
   redirect_back(fallback_location: root_path)
end 
  def edit
    if !user_signed_in? || current_user.email == "admin@gmail.com"
      flash[:error] = "Por Favor entre em sua conta para continuar"
      redirect_to root_path
  else 
   @auction = Auction.find(params[:id]) 
     ap = auction_params
     ap[:bet] = current_user.email  
    if @auction.update_attributes(ap)
      
       flash[:success] = "Lance Atualizado, Boa sorte"
      redirect_to root_path
    else
       flash[:success] = "Erro"
      redirect_to root_path
    end 
end  
  end
 private
  def auction_params
    params.permit(:bet)
  end
  def launch_params
    params.require(:launch).permit(:price)
  end  
end  
  