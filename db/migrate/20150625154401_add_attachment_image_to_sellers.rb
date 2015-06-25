class AddAttachmentImageToSellers < ActiveRecord::Migration
  def self.up
    change_table :sellers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sellers, :image
  end
end
