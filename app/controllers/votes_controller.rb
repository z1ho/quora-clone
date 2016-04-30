#QUESTION UPVOTES
post '/questions/:id/question_votes/upvote' do
  @question_votes = QuestionVote.new(question_id: params[:id], user_id: current_user.id, upvote: 1)
  @question_votes.save
  redirect "/questions"
end

#QUESTION DOWNVOTES
post '/questions/:id/question_votes/downvote' do
  @question_votes = QuestionVote.new(question_id: params[:id], user_id: current_user.id, downvote: 1)
  @question_votes.save
  redirect "/questions"
end

#ANSWER UPVOTES
get '/answers/:id/answer_votes/upvote' do
  @answer_votes = AnswerVote.new(answer_id: params[:id], user_id: current_user.id, upvote: 1)
  @answer_votes.save
  redirect "/questions"
end

#ANSWER DOWNVOTES
post '/answers/:id/answer_votes/downvote' do
  @answer_votes = AnswerVote.new(answer_id: params[:id], user_id: current_user.id, downvote: 1)
  @answer_votes.save
  redirect "/questions"
end

############### NOTES ###############

# When creating a new Question_vote, must record the user's ID i.e. current_user.id
# for get/post url's make sure to copy word-for-word!

# For UPVOTE, value for UPVOTE = 1 and downvote = 0
# For DOWNVOTE, value for upvote = 0 and DOWNVOTE = 1
