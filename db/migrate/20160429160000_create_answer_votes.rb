class CreateAnswerVotes < ActiveRecord::Migration

	def change
		create_table :answer_votes do |x|
			x.integer :user_id
			x.integer :answer_id
      x.integer :upvote, default :0
      x.integer :downvote, default :0
			x.datetime :created_at
			x.datetime :updated_at
		end
	end
end
