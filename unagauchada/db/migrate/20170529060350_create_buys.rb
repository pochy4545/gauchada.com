class CreateBuys < ActiveRecord::Migration[5.0]
  def change
    create_table :buys do |t|
      t.integer :cantidad
      t.float :precio_total
      t.float :precio_actual
      t.date :fecha

      t.timestamps
    end
  end
end
