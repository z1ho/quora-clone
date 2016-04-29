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

get '/logout' do
	erb :'static/logout'
end

post '/logout' do
	session[:user_id] = nil
	redirect "/logout"
end
