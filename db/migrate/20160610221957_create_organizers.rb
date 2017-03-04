class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :title
      t.string :address
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
