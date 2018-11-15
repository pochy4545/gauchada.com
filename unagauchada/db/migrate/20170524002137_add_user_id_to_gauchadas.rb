class AddUserIdToGauchadas < ActiveRecord::Migration[5.0]
  def change
    add_reference :gauchadas, :user, foreign_key: true
  end
end
