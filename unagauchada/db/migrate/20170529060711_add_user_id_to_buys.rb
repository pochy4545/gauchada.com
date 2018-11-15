class AddUserIdToBuys < ActiveRecord::Migration[5.0]
  def change
    add_reference :buys, :user, foreign_key: true 
  end
end
