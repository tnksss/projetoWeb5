class ProductsController < ApplicationController
	
  def index
    @products = Product.all
  end

  def show
	@product = Product.find(params[:id]) 
  end

  def edit
  end
   def new
  	@product = Product.new
  end
end
 