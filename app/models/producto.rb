class Producto < ActiveRecord::Base
  attr_accessible :concentracion_ing_activo, :estado, :id_categoria_producto, :id_proveedor, :ingrediente_activo, :nombre, :precio, :vigencia
end
