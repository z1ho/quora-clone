get '/user_signup' do
	erb :"static/user_signup"
end

post '/user_signup' do
	@user = User.create(username: params[:username], password: params[:password], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
			@user.save
				erb :"static/homepage"
end

get '/user_login' do
	erb :"static/user_login"
end

post '/user_login' do
	@user = User.find_by_username(params[:username])
	if @user.login(params[:password]) == true
		session[:user] = true									#verifies the session
		session[:user_id] = @user.id 					#assigns the user id
		session[:username] = @user.username 	#assigns username
		erb :'static/homepage'
	else 
		"Error, please sign up"
		erb :'static/user_signup'
 	end
end

#Checks if session[:user] is true
helpers do
  def user?
    session[:user]
  end
end


get '/profile' do
	# @current_user = session[:user_id]
	erb :'static/profile'
end

post '/profile' do
	# @current_user = session[:user_id]
	erb :'static/profile'
end


get '/user_answers' do
	erb :'static/user_answers'
end

get '/user_questions' do
	erb :'static/user_questions'
end
