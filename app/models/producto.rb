class Producto < ActiveRecord::Base
  attr_accessible :concentracion_ing_activo, :estado, :proveedor_id, :categoria_producto_id, :ingrediente_activo, :nombre, :precio, :ultimo_update,
  :tipo_formula, :cantidad_unitaria, :unidad, :empaque_unitario, :precio_unitario 
  belongs_to :categoria_producto
  belongs_to :proveedor
  
  #importar archivos csv 
  def self.importar_post(file)
    spreadsheet = open_spreadsheet(file)
    header = ["num_fila", "proveedor_id" , "categoria_producto_id", "nombre", "ingrediente_activo", "tipo_formula", "concentracion_ing_activo",
      "cantidad_unitaria", "unidad", "empaque_unitario", "precio", "precio_unitario", "ultimo_update"]
     
    (1..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      #TODO: relacionar proveedor y categoria con sus respectivas tablas     
      #TODO: hacer un log de los datos de los productos que no se insertaron , y pq razon
      
      #row = limpiar_row(row)

      #TODO: agregar validacion por proveedor y por categoria producto
      producto = Producto.where("nombre is ? AND ingrediente_activo is ? AND tipo_formula is ? 
      AND concentracion_ing_activo is ? AND cantidad_unitaria is ? AND unidad is ? AND empaque_unitario is ? 
      AND precio is ? AND precio_unitario is ?", row["nombre"], row["ingrediente_activo"], row["tipo_formula"], row["concentracion_ing_activo"], 
      row["cantidad_unitaria"], row["unidad"], row["empaque_unitario"], row["precio"], row["precio_unitario"]).first() || new
      
      row["estado"] = true
      producto.attributes = row.to_hash.slice(*accessible_attributes)
      producto.save!
    end
  end
  
  #abrir el csv 
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
  #limpiar caracteres y valores antes de guardar
  def self.limpiar_row(fila)
    if (!fila["precio"].nil?)
      fila["precio"] = fila["precio"].gsub(/[^0-9]/i, '')
      boolPrecio = !fila["precio"].nan?
  	  fila["precio"] = boolPrecio ? Float(fila["precio"]) : 0.0
    else
      fila["precio"] =0.0
    end
    
    if(!fila["precio_unitario"].nil?)
      fila["precio_unitario"] = fila["precio_unitario"].gsub(/[^0-9]/i, '')
  	  boolPrecioUnitario = !fila["precio_unitario"].nan?
  	  fila["precio_unitario"] = boolPrecioUnitario ? Float(fila["precio_unitario"]) : 0.0
    else
      fila["precio_unitario"] =0.0
    end
    
    if(!fila["concentracion_ing_activo"].nil?)
      fila["concentracion_ing_activo"] = fila["concentracion_ing_activo"].gsub(/[^0-9]/i, '')
  	  boolConcActiva = !fila["concentracion_ing_activo"].nan?
  	  fila["concentracion_ing_activo"] = boolConcActiva ? Float(fila["concentracion_ing_activo"]) : 0.0
    else
      fila["concentracion_ing_activo"] =0.0
    end
	  
    
	  fila["estado"] = true
    return fila
  end

end

class String
  def nan?
    self !~ /^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/
  end
end
