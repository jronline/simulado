class AddAttachmentImageToHelperObjects < ActiveRecord::Migration
  def self.up
    change_table :helper_objects do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :helper_objects, :image
  end
end
