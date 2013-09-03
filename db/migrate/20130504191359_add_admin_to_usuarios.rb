class AddAdminToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :admin, :boolean, :default => true
  end

  def self.down
    remove_column :usuarios, :admin
  end
end
