class CreateQuestions < ActiveRecord::Migration

	def change
		create_table :questions do |x|
			x.integer :user_id
			x.string :question
			x.string :caption
			x.datetime :created_at
			x.datetime :updated_at
		end
	end
end
