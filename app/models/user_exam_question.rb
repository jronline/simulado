class UserExamQuestion < ActiveRecord::Base
    belongs_to :user_exam
    belongs_to :question
end
