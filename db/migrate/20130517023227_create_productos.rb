class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :ingrediente_activo
      t.float :concentracion_ing_activo
      t.float :precio
      t.datetime :vigencia
      t.boolean :estado
      t.references :proveedor
      t.references :categoria_productos

      t.timestamps
            
    end
              
    add_index :productos, :proveedor_id
    add_index :productos, :categoria_productos_id
  end
end
