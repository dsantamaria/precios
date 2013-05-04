class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.boolean :estado, :default => true

      t.timestamps
    end
  end
end
