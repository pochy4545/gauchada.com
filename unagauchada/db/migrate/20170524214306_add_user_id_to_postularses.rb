class AddUserIdToPostularses < ActiveRecord::Migration[5.0]
  def change
    add_reference :postularses, :user, foreign_key: true
    add_reference :postularses, :gauchada, foreign_key: true
  end
end
