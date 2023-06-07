class Pelicula < ApplicationRecord
  belongs_to :arriendo, optional: true
  has_many :arriendos, dependent: :destroy
  has_many :clientes, through: :arriendos
  
  validates :titulo, presence: true
end
