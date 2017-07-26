class RemoveColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :dogs, :image_one
  end
end
