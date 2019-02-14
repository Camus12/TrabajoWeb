class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.integer :codigopersona
      t.integer :codigoestacionamiento
      t.integer :puntuacion
      t.string :comentario
      t.integer :codigocomentariopadre

      t.timestamps
    end
  end
end
