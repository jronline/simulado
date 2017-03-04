class Mock < ActiveRecord::Base
  belongs_to :institution
  belongs_to :organizer
  belongs_to :category
  belongs_to :area
  has_many :exams
end
