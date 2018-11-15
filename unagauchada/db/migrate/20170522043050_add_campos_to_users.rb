class AddCamposToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :telefono, :string
    add_column :users, :fecha_de_nacimiento, :datetime
    add_column :users, :es_admin, :boolean, default: false
  end
end
