class UserExam < ActiveRecord::Base
  belongs_to :user
  belongs_to :area
  has_many :user_exam_questions, dependent: :destroy
  has_many :questions, through: :user_exam_questions
  #teste
  #accepts_nested_attributes_for :user_exam_questions
end
