class CreateArriendoPeliculas < ActiveRecord::Migration[7.0]
  def change
    create_table :arriendo_peliculas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :pelicula, null: false, foreign_key: true
      t.timestamps
    end
  end
end

