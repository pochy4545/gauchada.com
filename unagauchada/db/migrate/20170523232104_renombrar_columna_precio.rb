class RenombrarColumnaPrecio < ActiveRecord::Migration[5.0]
  def change
  	rename_column :creditos, :precio, :total_de_creditos
  end
end
