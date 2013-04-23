class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :login
      t.string :pass
      t.timestamp :lastlogin

      t.timestamps
    end
  end
end
