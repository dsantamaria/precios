class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.boolean :estado

      t.timestamps
    end
  end
end
