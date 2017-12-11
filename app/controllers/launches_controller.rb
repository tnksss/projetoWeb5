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

        x = Launch.find(params[:launch][:product_id])
        x = Product.maximum("price")

        if(params[:launch][:price].to_i >  x) 
            if ((@launch.save))
                @launch.user_ids << params[:launch][:current_user_id] 
                params = acp 
                params[:user_ids] =  @launch.user_ids  
                @launch.update_attributes(params) 
            else
                redirect_back(fallback_location: root_path , :erro => "Erro" )
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
    