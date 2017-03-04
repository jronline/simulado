class AddQuestionTypeIdToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :question_type, index: true, foreign_key: true
  end
end
