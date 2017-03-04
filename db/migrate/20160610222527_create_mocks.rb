class CreateMocks < ActiveRecord::Migration
  def change
    create_table :mocks do |t|
      t.string :title
      t.integer :year
      t.string :edition
      t.date :application_date
      t.string :notice
      t.references :institution, index: true, foreign_key: true
      t.references :organizer, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
