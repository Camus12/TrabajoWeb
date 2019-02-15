class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators do |t|
      t.string :usuario
      t.string :contrasena

      t.timestamps
    end
  end
end
