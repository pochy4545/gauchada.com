class AddReputacionsIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :reputacion, foreign_key: true
  end
end
