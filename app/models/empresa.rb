class Empresa < ActiveRecord::Base
  attr_accessible :direccion, :estado, :nombre, :telefono
  has_many :usuarios
  validates :direccion, :nombre, :telefono, :presence => { :message => ": Ingrese un valor." }
end
