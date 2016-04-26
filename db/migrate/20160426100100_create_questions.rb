class CreateQuestions < ActiveRecord::Migration
	
	def change
		create_table :questions do |x|
			x.integer :user_id
			x.string :question 
			x.string :caption
			x.timestamp null: false
			x.integer :upvotes_answer, default: 0
			x.integer :upvotes_answer, default: 0
		end	
	end
end
