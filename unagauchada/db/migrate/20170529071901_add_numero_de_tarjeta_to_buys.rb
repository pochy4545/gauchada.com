class AddNumeroDeTarjetaToBuys < ActiveRecord::Migration[5.0]
  def change
  	add_column :buys, :numero_de_tarjeta, :integer
  end
end
