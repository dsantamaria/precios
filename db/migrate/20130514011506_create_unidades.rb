class CreateUnidades < ActiveRecord::Migration
  def change
    create_table :unidades do |t|
      t.string :nombre
      t.boolean :estado

      t.timestamps
    end
  end
end
