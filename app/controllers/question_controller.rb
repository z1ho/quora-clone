post'/questions' do
	@question = Question.new(user_id: session[:user_id], question: params[:question], caption: params[:caption])
		@question.save
		@all_questions = Question.all
		@all_answers = Answer.all
		erb :'/static/feed'
end

# post'/all_questions' do
# 	byebug
# 	@all_questions = Question.all
# 	erb :'/static/feed'
# end