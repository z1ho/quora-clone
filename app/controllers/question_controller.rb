post'/questions' do
	@question = Question.new(user_id: session[:user_id], question: params[:question], caption: params[:caption])
			@question.save
			erb :'/static/feed'
end
