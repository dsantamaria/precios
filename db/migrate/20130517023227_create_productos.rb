class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :ingrediente_activo
      t.string :concentracion_ing_activo
      t.string :tipo_formula
      t.string :cantidad_unitaria
      t.string :empaque_unitario
      t.string :precio
      t.string :precio_unitario      
      t.string :ultimo_update
      t.boolean :estado
      t.references :proveedor
      t.references :categoria_producto

      t.timestamps
            
    end
              
    add_index :productos, :proveedor_id
    add_index :productos, :categoria_producto_id
  end
end
