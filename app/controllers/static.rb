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

# DISPLAY ON FEED
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
