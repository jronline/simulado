class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :alternatives, :through => :answer
  has_many :answers
  has_many :user_exams
  
  validates :name, :presence => true
end
