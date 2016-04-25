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
	if @user.log_in(params[:password]) == true
		session[:user] = true
			erb :'static/user_homepage'
	else 
		erb :'static/user_signup'
 	end
end


#Checks if session[:user] is true
helpers do
  def user?
    session[:user]
  end
end

# get '/user_homepage' do
# 	halt(401, 'Not Authorized') unless user? 
# 		erb :'static/user_homepage'
# end

get '/user_logout' do
	erb :'static/user_logout'
end

post '/user_logout' do
	session[:user] = false
		"Succesfully Logged Out!"
end
