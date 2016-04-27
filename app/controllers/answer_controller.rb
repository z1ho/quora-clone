#(user_id: session[:user_id], answer: params[:answer], question_id: @question.id)
#user_id & question_id refers to the columns
#params[:answer] refers to the answers given by user


get '/questions/:question_id/answers/new' do
	@question = Question.find(params[:question_id])
	erb :"/static/answer"
end	

post '/questions/:question_id/answers' do
	@question = Question.find(params[:question_id])
	@all_questions = Question.all
	@answer = Answer.new(user_id: session[:user_id], answer: params[:answer], question_id: @question.id)	
	@answer.save
	@all_answers = Answer.all
	erb :"static/feed"
end

