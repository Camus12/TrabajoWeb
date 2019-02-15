class CreateEstacionamientoimagens < ActiveRecord::Migration[5.2]
  def change
    create_table :estacionamientoimagens do |t|
      t.string :foto
      t.references :estacionamiento, foreign_key: true

      t.timestamps
    end
  end
end
