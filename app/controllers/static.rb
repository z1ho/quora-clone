require_relative '../models/user'
require 'rubygems'
require 'sinatra'
require 'byebug'

enable :sessions

get '/' do
  erb :"static/index"
end

get '/user_login' do
	erb :"static/user_login"
end

post '/user_login' do
	@user = User.find_by_username(params[:username])
	if @user.login(params[:password]) == true
		session[:user] = true							#verifies the session
		session[:user_id] = @user.id 					#assigns the user id
		session[:username] = @user.username 			#assigns username
			erb :'static/homepage'
	else 
		"Error, please sign up"
		erb :'static/user_signup'
 	end
end

get '/profile' do
	erb :'static/profile'
end

post '/profile' do
	erb :'static/profile'
end


#Checks if session[:user] is true
helpers do
  def user?
    session[:user]
  end
end

# get '/homepage' do
# 	halt(401, 'Not Authorized') unless user? 
# 		erb :'static/homepage'
# end

get '/user_logout' do
	erb :'static/user_logout'
end

post '/user_logout' do
	session[:user] = false
		"Succesfully Logged Out!"
end
