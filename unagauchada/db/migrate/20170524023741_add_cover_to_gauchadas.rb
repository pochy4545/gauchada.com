class AddCoverToGauchadas < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :gauchadas, :cover
  end
end
