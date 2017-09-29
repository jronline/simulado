class AddAttachmentImageToAlternatives < ActiveRecord::Migration
  def self.up
    change_table :alternatives do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :alternatives, :image
  end
end
