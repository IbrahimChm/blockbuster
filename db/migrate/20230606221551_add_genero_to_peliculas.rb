class AddGeneroToPeliculas < ActiveRecord::Migration[7.0]
  def change
    add_column :peliculas, :genero, :string
  end
end
