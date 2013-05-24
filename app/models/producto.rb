class Producto < ActiveRecord::Base
  attr_accessible :concentracion_ing_activo, :estado, :proveedor_id, :categoria_producto_id, :ingrediente_activo, :nombre, :precio, :ultimo_update,
  :tipo_formula, :cantidad_unitaria, :empaque_unitario, :precio_unitario
  validates :precio, :numericality => { :message => ": Ha ingresado un valor no valido." }
  validates :precio_unitario, :numericality => { :message => ": Ha ingresado un valor no valido." }  
  belongs_to :categoria_producto
  belongs_to :proveedor
  
  #importar archivos csv 
  def self.importar_post(file)

    spreadsheet = open_spreadsheet(file)
    header = ["num_fila", "proveedor_id" , "categoria_producto_id", "nombre", "ingrediente_activo", "tipo_formula", "concentracion_ing_activo",
      "cantidad_unitaria", "TODO:UNIDAD!!!!!!", "empaque_unitario", "precio", "precio_unitario", "ultimo_update"]
     
#:proveedor_id, :categoria_producto_id, :nombre, :ingrediente_activo, :tipo_formula, :concentracion_ing_activo, :cantidad_unitaria, capacidad unitaria, :empaque_unitario, :precio, :precio_unitario, :ultimo_update
    (1..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      #TODO: arreglar tema columna unidades, agregarla a la DB, migrar toda la DB para corregir cambios en producto (floats y strings)
      #TODO: relacionar proveedor y categoria con sus respectivas tablas     
      #TODO: hacer un log de los datos de los productos que no se insertaron , y pq razon
      row = limpiar_row(row)
      #TODO: agregar validacion por proveedor y por categoria producto
      producto = Producto.find(:first, :conditions => [" nombre = '"+row['nombre']+"' AND  ingrediente_activo ='"+row['ingrediente_activo']+
        "' AND  tipo_formula ='"+row['tipo_formula']+"' AND  concentracion_ing_activo='"+row['concentracion_ing_activo']+
        "' AND  cantidad_unitaria ="+row['cantidad_unitaria']+" AND  empaque_unitario ='"+row['empaque_unitario']+
        "' AND  precio ='"+String(row['precio'])+"' AND  precio_unitario ='"+String(row['precio_unitario'])+"'"]) || new

      producto.attributes = row.to_hash.slice(*accessible_attributes)
      producto.save!
    end
  end
  
  #limpiar caracteres y valores antes de guardar
  def self.limpiar_row(fila)
    fila["precio"] = fila["precio"].gsub('$','')
    fila["precio"] = Float(fila["precio"].gsub(',',''))
    fila["precio_unitario"] = fila["precio_unitario"].gsub('$','')
    fila["precio_unitario"] = Float(fila["precio_unitario"].gsub(',',''))
    fila["concentracion_ing_activo"] = fila["concentracion_ing_activo"].gsub('%','')
    fila["estado"] = true
    return fila
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

end
