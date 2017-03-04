class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :title
      t.string :state

      t.timestamps null: false
    end
  end
end
