class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :user, inverse_of: :questions

  validates :title,  presence: true, length: { maximum: 255 }
end
