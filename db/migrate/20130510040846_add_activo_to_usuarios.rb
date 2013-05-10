class AddActivoToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :activo, :boolean, :default => false
  end

  def self.down
    remove_column :usuarios, :activow
  end
end
