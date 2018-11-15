class AddColumnToCompra < ActiveRecord::Migration[5.0]
  def change
  	add_column :compras, :precio_actual, :float
  end
end
