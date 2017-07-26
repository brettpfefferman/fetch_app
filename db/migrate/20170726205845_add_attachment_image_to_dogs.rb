class AddAttachmentImageToDogs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :dogs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dogs, :image
  end
end
