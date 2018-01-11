class UserExamQuestion < ActiveRecord::Base
    belongs_to :user_exam
    belongs_to :question
    
    validates :user_exam_id, :question_id, presence: true
end
