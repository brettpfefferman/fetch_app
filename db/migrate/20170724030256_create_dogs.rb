class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.string :size
      t.text :bio

      t.timestamps
    end
  end
end
