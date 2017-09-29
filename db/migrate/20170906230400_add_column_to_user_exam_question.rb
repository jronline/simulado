class AddColumnToUserExamQuestion < ActiveRecord::Migration
  def change
    add_column :user_exam_questions, :user_exam_id, :integer
    add_column :user_exam_questions, :question_id, :integer
  end
end
