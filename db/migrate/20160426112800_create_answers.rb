class CreateAnswers < ActiveRecord::Migration
	
	def change
		create_table :answers do |x|
			x.integer :user_id
			x.integer :question_id
			x.string :answer 
			x.string :caption
			x.timestamp null: false
			x.integer :upvotes_answer, default: 0
			x.integer :downvotes_answer, default: 0
		end	
	end
end
