class Cliente < ApplicationRecord
  has_many :arriendo_peliculas, class_name: 'ArriendoPelicula'
  has_many :peliculas_arrendadas, through: :arriendo_peliculas, source: :pelicula

  validates :nombre, presence: true
end


