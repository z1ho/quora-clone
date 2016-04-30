get '/signup' do
	erb :"static/signup"
end

post '/signup' do
	@user = User.create(username: params[:username], password: params[:password], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])
		@user.save
		login(@user)
		erb :"static/homepage"
end

get '/login' do
	erb :"static/login"
end

post '/login' do
	@user = User.find_by_username(params[:username])

	if @user.login(params[:password]) == true
		# session[:user] = true										#verifies the session
		# session[:user_id] = @user.id 								#assigns the user id
		# session[:username] = @user.username 						#assigns username
		login(@user)
		erb :'static/homepage'
	else
		"Error, please sign up"
		erb :'static/signup'
 	end
end

get '/profile' do
	erb :'users/profile'
end

post '/profile' do
	erb :'users/profile'
end

get '/feed' do
	@question = Question.new(user_id: session[:user_id], question: params[:question], caption: params[:caption])
	@question.save
	@all_questions = Question.all
	@all_answers = Answer.all
	erb :'static/feed'
end

post '/feed' do
	erb :'static/feed'
end

get '/user_answers' do
	erb :'static/user_answers'
end

get '/user_questions' do
	erb :'static/user_questions'
end
