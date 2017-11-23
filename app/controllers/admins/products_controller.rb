class Admins::ProductsController < Admins::BaseController
  def index
  end
  def new
  	@product = Product.new
  end
  def create
    @product = Product.new(product_params)
    
   @product.save
   
  end
  def show
     @product = Product.find(params[:id]) 

  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :state, :description)
  end

end