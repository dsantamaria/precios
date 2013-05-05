class Proveedor < ActiveRecord::Base
  attr_accessible :direccion, :estado, :nombre, :telefono
end
