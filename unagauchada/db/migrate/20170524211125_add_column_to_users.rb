class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :creditos, :integer, default: 1
  	add_column :users, :clalificacion, :integer, default: 1
  end
end
