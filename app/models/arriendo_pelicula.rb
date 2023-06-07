class ArriendoPelicula < ApplicationRecord
  belongs_to :cliente
  belongs_to :pelicula
end
