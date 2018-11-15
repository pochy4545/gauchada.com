class CreateCreditos < ActiveRecord::Migration[5.0]
  def change
    create_table :creditos do |t|
      t.integer :precio

      t.timestamps
    end
  end
end
