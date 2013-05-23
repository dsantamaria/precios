class Producto < ActiveRecord::Base
  attr_accessible :concentracion_ing_activo, :estado, :proveedor_id, :categoria_producto_id, :ingrediente_activo, :nombre, :precio, :ultimo_update,
  :tipo_formula, :cantidad_unitaria, :empaque_unitario, :precio_unitario
  validates :concentracion_ing_activo, :numericality =>  { :message => ": Ha ingresado un valor no valido." }
  validates :precio, :numericality => { :message => ": Ha ingresado un valor no valido." }
  belongs_to :categoria_producto
  belongs_to :proveedor
  
  def self.importar_post(file)
=begin
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash.slice(*accessible_attributes)
      product.save!
    end
=end
  end

end
