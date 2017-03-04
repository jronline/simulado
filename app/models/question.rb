class Question < ActiveRecord::Base
  
  # referencias
  belongs_to :exam
  belongs_to :question_type
  has_many :helper_objects
  has_many :alternatives
  
  validates :number , :question_type_id, presence: true

end
