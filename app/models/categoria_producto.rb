class CategoriaProducto < ActiveRecord::Base
  attr_accessible :estado, :nombre
  validates :nombre, :presence => { :message => ": Ingrese un valor." }
  has_many :productos
end
