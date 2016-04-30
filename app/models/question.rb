class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	has_many :question_votes
	has_many :answers, dependent: :destroy

	validates :question, presence: true
	validates :user_id, presence: true  #ensures that if you don't have a user, you cant have questions or answers
end
