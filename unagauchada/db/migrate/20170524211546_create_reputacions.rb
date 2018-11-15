class CreateReputacions < ActiveRecord::Migration[5.0]
  def change
    create_table :reputacions do |t|
      t.string :nombre
      t.integer :inicio
      t.integer :fin

      t.timestamps
    end
  end
end
