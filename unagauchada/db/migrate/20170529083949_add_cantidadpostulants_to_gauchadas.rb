class AddCantidadpostulantsToGauchadas < ActiveRecord::Migration[5.0]
  def change
  	add_column :gauchadas, :cant_postulantes, :integer ,default: 0
  end
end
