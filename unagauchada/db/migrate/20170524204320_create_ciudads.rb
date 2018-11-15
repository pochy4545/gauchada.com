class CreateCiudads < ActiveRecord::Migration[5.0]
  def change
    create_table :ciudads do |t|
      t.string :nombre
      t.string :provincia

      t.timestamps
    end
  end
end
