class CreateHelperObjects < ActiveRecord::Migration
  def change
    create_table :helper_objects do |t|
      t.text :title
      t.text :text
      t.text :font
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
