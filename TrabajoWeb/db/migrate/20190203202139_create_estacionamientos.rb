class CreateEstacionamientos < ActiveRecord::Migration[5.2]
  def change
    create_table :estacionamientos do |t|
      t.integer :codigopersona
      t.string :nombredescriptivo
      t.string :direccion
      t.string :direcciongooglemaps
      t.string :numerotelefono
      t.decimal :precioporhora
      t.decimal :largo
      t.decimal :ancho
      t.decimal :altura
      t.string :tipo
      t.string :ubicacion

      t.timestamps
    end
  end
end
