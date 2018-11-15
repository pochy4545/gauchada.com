class AddIdCategoryToGauchada < ActiveRecord::Migration[5.0]
  def change
  	add_reference :gauchadas, :categories, foreign_key: true
  end
end
