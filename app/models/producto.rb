class Producto < ActiveRecord::Base
  attr_accessible :concentracion_ing_activo, :estado, :proveedor_id, :categoria_productos_id, :ingrediente_activo, :nombre, :precio, :vigencia
  validates :concentracion_ing_activo, :numericality =>  { :message => ": Ha ingresado un valor no valido." }
  validates :precio, :numericality => { :message => ": Ha ingresado un valor no valido." }
  belongs_to :proveedor
  belongs_to :categoria_productos
end
