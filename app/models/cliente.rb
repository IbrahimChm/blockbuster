class Cliente < ApplicationRecord
  has_many :arriendo_peliculas
  has_many :peliculas_arrendadas, through: :arriendo_peliculas, source: :pelicula
  
  validates :nombre, presence: true
end


