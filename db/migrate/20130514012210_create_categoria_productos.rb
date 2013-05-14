class CreateCategoriaProductos < ActiveRecord::Migration
  def change
    create_table :categoria_productos do |t|
      t.string :nombre
      t.boolean :estado

      t.timestamps
    end
  end
end
