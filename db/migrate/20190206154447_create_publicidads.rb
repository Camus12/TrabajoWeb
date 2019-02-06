class CreatePublicidads < ActiveRecord::Migration[5.2]
  def change
    create_table :publicidads do |t|
      t.integer :nombredescriptivo
      t.string :nombrecliente
      t.string :imagen
      t.decimal :tarifa
      t.integer :ubicacion
      t.integer :frecuencia
      t.integer :fecha
      t.string :enlace
      t.integer :estado
      t.text :detalles

      t.timestamps
    end
  end
end
