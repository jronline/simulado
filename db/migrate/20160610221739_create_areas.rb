class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
