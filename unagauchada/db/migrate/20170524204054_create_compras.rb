class CreateCompras < ActiveRecord::Migration[5.0]
  def change
    create_table :compras do |t|
      t.integer :cantidad
      t.float :precio
      t.date :fecha

      t.timestamps
    end
  end
end
