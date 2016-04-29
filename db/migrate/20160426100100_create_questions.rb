class CreateQuestions < ActiveRecord::Migration
	
	def change
		create_table :questions do |x|
			x.integer :user_id
			x.string :question 
			x.string :caption
			x.datetime :created_at
			x.datetime :updated_at	
			x.integer :upvotes_question, default: 0
			x.integer :downvotes_question, default: 0			
		end	
	end
end
