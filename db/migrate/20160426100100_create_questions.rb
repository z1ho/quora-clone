class CreateQuestions < ActiveRecord::Migration
	
	def change
		create_table :questions do |x|
			x.integer :user_id
			x.string :question 
			x.string :caption
			x.integer :upvotes_answer, default: 0
			x.integer :downvotes_answer, default: 0
			x.datetime :created_at
			x.datetime :updated_at	
		end	
	end
end
