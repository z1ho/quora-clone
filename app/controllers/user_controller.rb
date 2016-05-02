# User SIGN-UP
get '/signup' do
	erb :"static/signup"
end

post '/signup' do
	@user = User.create(username: params[:username], password: params[:password], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
	@user.save
	login(@user)
	erb :"static/homepage"
end

# User LOG-IN
get '/login' do
	erb :"static/login"
end

post '/login' do
	@user = User.find_by_username(params[:username])

	if @user.login(params[:password]) == true
		# session[:user] = true											#verifies the session
		# session[:user_id] = @user.id 							#assigns the user id
		# session[:username] = @user.username 			#assigns username
		login(@user)
		erb :'static/homepage'
	else
		"Error, please sign up"
		erb :'static/signup'
 	end
end

# User LOG-OUT
get '/logout' do
	erb :'static/logout'
end

post '/logout' do
	session[:user_id] = nil
	redirect "/logout"
end

# User Profile Page
get '/profile' do
	erb :'users/profile'
end

post '/profile' do
	erb :'users/profile'
end

# EDIT User's Profile

# get '/users/:id/edit' do
# 		@user = User.find(params[:id])
# 		erb :'/users/show'
# end

get '/users/:id/edit' do   				#works but need to refresh the page..?
	@user =  User.find(params[:id])
	erb :'/users/edit'
end

patch '/users/:id' do 			#took out /edit
	@user = User.find(params[:id])
	@user.update(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
	@user.save
	redirect "/profile"
end

# DELETE a user

delete '/users/:id' do
	@user = User.find(params[:id])
	@user.destroy
	byebug
	redirect "/signup"
end