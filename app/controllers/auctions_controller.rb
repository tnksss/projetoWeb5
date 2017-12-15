class AuctionsController < ApplicationController
  def index
  	@auctions = Auction.all
  end

  def show
  	@auction = Auction.find(params[:id])
  	@products = @auction.products
  end
end
