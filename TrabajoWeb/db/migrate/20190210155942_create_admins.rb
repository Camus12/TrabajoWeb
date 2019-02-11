class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :codigo
      t.string :clave

      t.timestamps
    end
  end
end
