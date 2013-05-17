class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.integer :id_proveedor
      t.integer :id_categoria_producto
      t.string :nombre
      t.string :ingrediente_activo
      t.float :concentracion_ing_activo
      t.float :precio
      t.datetime :vigencia
      t.boolean :estado

      t.timestamps
    end
  end
end
