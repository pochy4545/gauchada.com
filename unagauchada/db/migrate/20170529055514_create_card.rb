class CreateCard < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :numero
      t.float :credito

      t.timestamps
    end
  end
end
