class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :number
      t.string :type
      t.boolean :veracity
      t.references :exam, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
