class Admins::ProductsController < Admins::BaseController
 def index
    @products = Product.all
    
  end
  def new
  	@product = Product.new
  end
  def create
    @product = Product.new(product_params)
    
   if @product.save
      redirect_to admins_products_path
   else 
      render :new   
   end 
    
  end
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admins_products_path, :notice => "Produto deletado."
  end
   def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
       flash[:success] = "Produto Atualizado"
      redirect_to admins_products_path
    else
      render 'edit'
    end
  end
  def show
     @product = Product.find(params[:id]) 

  end
  def edit
    @product = Product.find(params[:id])
  end

  private
  


  def product_params
    params.require(:product).permit(:name, :price, :state, :description,  {images: []})
  end

end