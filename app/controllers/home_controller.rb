class HomeController < ApplicationController
	helper_method :current_user

def current_user=(user)
  @current_user = user
end
  def index
  	@auctions = Auction.all
  	@products = Product.all
  	
  end
  def edit
  	if !user_signed_in?
	    flash[:error] = "Por Favor entre em sua conta para continuar"
      redirect_to root_path
	else   
    if @auction.update_attributes(ap)
    	 @auction = Auction.find(params[:id])
	    ap = auction_params
	    ap[:bet] = current_user.email
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
end  
 