class CreateUserExams < ActiveRecord::Migration
  def change
    create_table :user_exams do |t|
      t.text :title
      t.references :user, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true
      t.date :date_application

      t.timestamps null: false
    end
  end
end
