class Admins::AuctionsController < Admins::BaseController
  def index
    @auctions = Auction.all
  end 

  def new
    @auction = Auction.new
  end 

  def show 
    @auction = Auction.find(params[:id])
    @products = @auction.products
  end

  def edit
    @auction = Auction.find(params[:id])

  end

  def update
    @auction = Auction.find(params[:id])
    if @auction.update_attributes(auction_params)
       flash[:success] = "Leilao Atualizado"
      redirect_to admins_auctions_path
    else
      render 'edit'
    end
  end

  def create
    @auction = Auction.new(auction_params)

    if @auction.save
      redirect_to admins_auctions_path
    else
      render :new
    end
  end

  def destroy
    auction = Auction.find(params[:id])
    auction.destroy
    redirect_to admins_auctions_path, :notice => "Leilao deletado."
  end

  def add_products
    @auction = Auction.find(params[:auction_id])
    @products = Product.all.unscoped.order("id")

  end 

 def add_new_product
  @product = Product.find(params[:product_id])
  @auction = Auction.find(params[:auction_id]) #
  @auction.product_ids << params[:product_id]  #
  params = acp # 
  par = pp
  params[:product_ids] =  @auction.product_ids  #
  par[:flag] = false
  @product.update_attributes(par)
  @auction.update_attributes(params) #
   redirect_back(fallback_location: root_path)
end 
def delete_product
 @product = Product.find(params[:product_id])
 @auction = Auction.find(params[:auction_id])
 aux = params[:product_id].to_i
  @auction.product_ids << params[:product_ids]
  params = acp
  @auction.product_ids.delete(aux)
   par = pp
  params[:product_ids] =  @auction.product_ids
   par[:flag] = true
  @product.update_attributes(par)
  @auction.update_attributes(params)
   redirect_back(fallback_location: root_path)
end 
  private
  def acp  
    params.permit({product_ids: []} )
  end 
  def pp
    params.permit(:flag)
  end
  def auction_params
    params.require(:auction).permit(:end_date, :begin_date, :image, :title, {product_ids: []} )
  end
end

 