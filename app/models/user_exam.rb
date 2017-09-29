class UserExam < ActiveRecord::Base
  belongs_to :user
  belongs_to :area
  has_many :user_exam_questions
  has_many :questions, through: :user_exam_questions
end
