class Exam < ActiveRecord::Base
  belongs_to :mock
  has_many :questions
end
