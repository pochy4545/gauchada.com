class CreateTarjeta < ActiveRecord::Migration[5.0]
  def change
    create_table :tarjeta do |t|
      t.integer :numero
      t.float :credito

      t.timestamps
    end
  end
end
