class AddEmailToProveedors < ActiveRecord::Migration
  def change
    add_column :proveedors, :email, :string
  end
end
