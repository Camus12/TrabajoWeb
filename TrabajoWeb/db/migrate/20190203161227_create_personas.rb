class CreatePersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :personas do |t|
      t.integer :codigopersona
      t.string :nombre
      t.string :apepaterno
      t.string :apematerno
      t.boolean :sexo 
      t.string :tipodocumento 
      t.integer :numerodocumento 
      t.boolean :tipousuario
      t.string :correo
      t.string :contraseña
      t.date :fechanacimiento 
      t.integer :numerocel 
      t.string :distrito 
      t.string :direccion 

      t.timestamps
    end
  end
end
