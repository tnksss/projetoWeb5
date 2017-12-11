class LaunchesController < ApplicationController
    
    def index
    end
	
	def find
	    @launch = Launch.new
	end
    
    def show
    	@launch = Launch.find(params[:id]) 
    end

    def edit 
    end 
 	
 	def new  
        @launch = Launch.new
        @launch = current_user.launches.new
    end 
 
    def create 
        @product = Product.find(params[:launch][:product_id])
        @user = User.find(params[:launch][:current_user_id])
        @launch = Launch.new(launch_params)
        @launches = Launch.all 
       y = 0
        x = Product.maximum("price")
        @launches.each do |launch|
            if (launch.product_id == params[:launch][:product_id].to_i)
                if (launch.price > y)
                    y = launch.price
                 end   
            end     
        end    
        
        if(params[:launch][:price].to_i >  y && params[:launch][:price].to_i > @product.price) 
            if ((@launch.save))
                @launch.user_ids << params[:launch][:current_user_id] 
                params = acp 
                params[:user_ids] =  @launch.user_ids  
                if @launch.update_attributes(params) 
                    flash[:success] = "Boa Sorte"
                    redirect_back(fallback_location: root_path )
                else     
                    flash[:error] = "Erro"
                    redirect_back(fallback_location: root_path )
                end    
            else
                flash[:error] = "Erro ao dar o lance, tente novamente"
                redirect_back(fallback_location: root_path  )
            end
        else
            flash[:error] = "Voce nao pode dar um lance inferior ao lance atual"
            redirect_back(fallback_location: root_path)
        end  
    end 
    
    private
    	def acp  
        	params.permit({user_ids: []} )
   	 	end 
    	def launch_params
        	params.require(:launch).permit(:price, :product_id, {user_ids: []} )
    	end

end
    