class Empresa < ActiveRecord::Base
  attr_accessible :direccion, :estado, :nombre, :telefono
  has_many :usuarios
end
