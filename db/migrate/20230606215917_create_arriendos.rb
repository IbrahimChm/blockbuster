class CreateArriendos < ActiveRecord::Migration[7.0]
  def change
    create_table :arriendos do |t|
      t.references :cliente, null: false, foreign_key: { on_delete: :cascade }
      t.references :pelicula, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end

