# DISPLAY ALL questions (i.e. an index for all questions)
get '/questions' do
	@questions = Question.all
	erb :'/questions/index'
end

# DISPLAY a specific question
get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :'/questions/show'
end


#@sorted_question = Question.order

# CREATE a new question
post '/questions' do
	@question = Question.new(user_id: session[:user_id], question: params[:question], caption: params[:caption])
	if @question.save
		redirect "/questions"
	else

	end
end

# GET the Form to EDIT a specific question
get '/questions/:id/edit' do
	@question =  Question.find(params[:id])
	erb :'/questions/edit'
end

# PATCH i.e. to process the input from the Form to EDIT a specific question
patch '/questions/:id' do
	@question = Question.find(params[:id])
	@question.update(question: params[:question])
	@question.save
	redirect "/questions/#{@question.id}"
end

# DESTROY a particular question
delete '/questions/:id' do
	@question = Question.find(params[:id])
	@question.destroy
	redirect "/questions"
end

########## EARLIER VERSION ##########

# post'/questions' do
# 	@question = Question.new(user_id: session[:user_id], question: params[:question], caption: params[:caption])
# 		@question.save
# 		@all_questions = Question.all
# 		@all_answers = Answer.all
# 		erb :'/static/feed'
# end

# get '/questions/<%= @question.id %>/user_answers'
# 	erb :'static/user_answers'
# end

# get '/questions/:id' do
#   @user_question_show Question.find(params[:question_id])
#   erb :"static/questions/show"
# end


# post'/all_questions' do
# 	byebug
# 	@all_questions = Question.all
# 	erb :'/static/feed'
# end

#####################################
