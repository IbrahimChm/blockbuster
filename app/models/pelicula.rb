class Pelicula < ApplicationRecord
  belongs_to :cliente, optional: true  
  has_many :arriendos
    has_many :clientes, through: :arriendos
  
    validates :titulo, presence: true
  
end
  