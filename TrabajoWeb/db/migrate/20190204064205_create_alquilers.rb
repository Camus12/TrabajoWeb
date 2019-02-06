class CreateAlquilers < ActiveRecord::Migration[5.2]
  def change
    create_table :alquilers do |t|
      t.integer :codigopersona
      t.integer :codigoestacionamiento
      t.datetime :inicioalquiler
      t.datetime :finalquiler
      t.decimal :precioporhora
      t.decimal :preciototal

      t.timestamps
    end
  end
end
