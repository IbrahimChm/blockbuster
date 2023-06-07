class Cliente < ApplicationRecord
  has_many :arriendos, dependent: :destroy
  has_many :peliculas_arrendadas, through: :arriendos, source: :pelicula
  validates :nombre, presence: true
end
