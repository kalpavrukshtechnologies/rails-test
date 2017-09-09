class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user, inverse_of: :answers
  validates :body, presence: true, length: { maximum: 255 }
  validates :question_id, presence: true
  validates :user_id, presence: true
end
