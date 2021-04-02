module SessionsHelper

	# Logs in the given user.
	def log_in(user)
		session[:user_id] = user.id
	end

	def currentuser
		if session[:user_id]
		   @current_user ||= User.find_by(id: session[:user_id])
		end
	end

	def logged_in?
		!currentuser.nil?
	end

    def log_out
    	session.delete(:user_id)
    	@current_user = nil
    end	
end
