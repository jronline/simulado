class CreateUserExamQuestions < ActiveRecord::Migration
  def change
    create_table :user_exam_questions do |t|
      t.integer :order
      t.float :rating
      t.timestamps null: false
    end
  end
end
