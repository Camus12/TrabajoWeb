class CreateServiciosadicionales < ActiveRecord::Migration[5.2]
  def change
    create_table :serviciosadicionales do |t|
      t.integer :codigopersona
      t.string :tiposervicio
      t.text :descripcion

      t.timestamps
    end
  end
end
