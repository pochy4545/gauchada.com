class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios do |t|
      t.date :fecha
      t.text :texto
      t.date :hora

      t.timestamps
    end
  end
end
