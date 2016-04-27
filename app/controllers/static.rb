require_relative '../models/user'
require 'rubygems'
require 'sinatra'
require 'byebug'

enable :sessions

get '/' do
  erb :"static/index"
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
