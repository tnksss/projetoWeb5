class Users::DashboardController < Users::BaseController
  	helper_method :current_user
  	def index
  		current_user.email
  	end

	def current_user=(user)
	    @current_user = user
	end

end