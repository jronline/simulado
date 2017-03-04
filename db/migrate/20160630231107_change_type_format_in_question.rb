class ChangeTypeFormatInQuestion < ActiveRecord::Migration
  def change
    change_column :questions, :type, :integer
  end
end
