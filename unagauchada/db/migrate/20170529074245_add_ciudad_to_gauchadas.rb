class AddCiudadToGauchadas < ActiveRecord::Migration[5.0]
  def change
  	add_column :gauchadas, :ciudad, :string
  end
end
