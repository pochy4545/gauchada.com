	class AddUserIdToCompras < ActiveRecord::Migration[5.0]
  def change
    add_reference :compras, :user, foreign_key: true
  end
end
