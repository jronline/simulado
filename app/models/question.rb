class Question < ActiveRecord::Base
  
  # referencias
  belongs_to :exam
  belongs_to :question_type
  has_many :helper_objects, dependent: :destroy
  has_many :alternatives, dependent: :destroy
  has_many :user_exam_questions, dependent: :destroy
  has_many :user_exam, through: :user_exam_questions
  
  validates :number, :exam_id, :veracity, :question_type_id, presence: true

end
