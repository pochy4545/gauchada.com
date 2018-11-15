class CreateGauchadas < ActiveRecord::Migration[5.0]
  def change
    create_table :gauchadas do |t|
      t.string :nombre
      t.string :title
      t.text :descripcion
      t.string :estado
      t.date :fecha_de_inicio
      t.date :fecha_limite

      t.timestamps
    end
  end
end
