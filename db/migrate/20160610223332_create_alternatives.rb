class CreateAlternatives < ActiveRecord::Migration
  def change
    create_table :alternatives do |t|
      t.text :title
      t.boolean :veracity
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
