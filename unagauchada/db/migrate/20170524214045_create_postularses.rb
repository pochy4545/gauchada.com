class CreatePostularses < ActiveRecord::Migration[5.0]
  def change
    create_table :postularses do |t|
      t.boolean :aprobado

      t.timestamps
    end
  end
end
