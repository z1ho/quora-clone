get '/user_signup' do
	erb :"static/user_signup"
end

post '/user_signup' do
	@user = User.create(username: params[:username], password: params[:password], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
		@user.password
			@user.save
				erb :"static/user_homepage"
end