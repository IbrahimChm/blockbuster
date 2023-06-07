class Pelicula < ApplicationRecord
  belongs_to :cliente, optional: true
  has_many :arriendos, dependent: :destroy
  has_many :clientes, through: :arriendos
  
  validates :titulo, presence: true
end

