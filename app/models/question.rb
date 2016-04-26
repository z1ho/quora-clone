class Question < ActiveRecord::Base
	has_one :user
	has_many :answers
end