class AddDescripcionToPostularses < ActiveRecord::Migration[5.0]
  def change
  	add_column :postularses, :descripcion, :string
  end
end
