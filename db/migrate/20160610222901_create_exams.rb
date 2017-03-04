class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.references :mock, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
