# DISPLAY ALL answers (i.e. an index for all answer)
get '/answers' do
	@answer = Answer.all
	erb :'/answers/index'
end

# DISPLAY a specific question
get '/answer/:id' do 
	@answer = Answer.find(params[:id])
	erb :'/answers/show'
end

# CREATE a new answer
post '/answers' do 
	@answer = Answer.new(user_id: session[:user_id], answer: params[:answer])
	@answer.save
	redirect "/answers"
end

# GET the Form to EDIT a specific answer
get '/answers/:id/edit' do
	@answer = Answer.find(params[:id])
	erb :'/answers/edit'
end

# PATCH i.e. to process the input from the Form to EDIT a specific answer
patch '/answer/:id' do
	@answer = Answer.find(params[:id])
	@answer.update(answer: params[:answer])
	@answer.save
	redirect "/answers/#{@answer.id}"
end

# DESTROY a particular answer
delete '/answers/:id' do 
	@answer = Answer.find(params[:id])
	@answer.destroy
	redirect "/answers"
end 

########## EARLIER VERSION ##########

#(user_id: session[:user_id], answer: params[:answer], answer_id: @question.id)
#user_id & question_id refers to the columns
#params[:answer] refers to the answers given by user


# get '/questions/:question_id/answers/new' do
# 	@question = Question.find(params[:question_id])
# 	erb :"/static/answer"
# end	

# post '/questions/:question_id/answers' do
# 	@question = Question.find(params[:question_id])
# 	@all_questions = Question.all
# 	@answer = Answer.new(user_id: session[:user_id], answer: params[:answer], question_id: @question.id)	
# 	@answer.save
# 	@all_answers = Answer.all
# 	erb :"static/feed"
# end

#####################################