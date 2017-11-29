class ProductController < ApplicationController
	
  def index
  end

  def show
	@product = Product.find(params[:id]) 
  end

  def edit
  end
end
