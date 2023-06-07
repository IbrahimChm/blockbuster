class AddPeliculaIdsToClientes < ActiveRecord::Migration[7.0]
  def change
    add_column :clientes, :pelicula_ids, :string
  end
end
