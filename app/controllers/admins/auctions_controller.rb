class Admins::AuctionsController < Admins::BaseController
  def index
    @auctions = Auction.all
  end 

  def new
    @auction = Auction.new
  end

  def show 
    @auction = Auction.find(params[:id])
    @products = Product.all
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
    @products = Product.all
  end

  private

  def auction_params
    params.require(:auction).permit(:end_date, :begin_date, :image, :title, {product_ids: []} )
  end
end

 