class Admins::DashboardController < Admins::BaseController
  def index
  	@users = User.all
  	@products = Product.all
  	@auctions = Auction.all
  end
end