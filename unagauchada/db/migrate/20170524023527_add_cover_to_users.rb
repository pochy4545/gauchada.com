class AddCoverToUsers < ActiveRecord::Migration[5.0]
  def change
  	 add_attachment :users, :cover
  end
end
