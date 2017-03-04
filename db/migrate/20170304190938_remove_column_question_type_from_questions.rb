class RemoveColumnQuestionTypeFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :question_type
  end
end
