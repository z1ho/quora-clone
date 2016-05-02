helpers do 
# 	#This will return the current user, if they exist
# 	#Replace with code that works with your application
	def current_user
		@current_user ||= User.find_by_id(session[:user_id])	
	end

# #Returns true if current_user exists, false otherwise
	
	def login(user)
		session[:user_id] = user.id		
	end

	def logged_in?
		!current_user.nil?
	end
end


#Think of sessions as a storage space. Cookies is a type 
#of session
 