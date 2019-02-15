class CreateEstacionamientoservicios < ActiveRecord::Migration[5.2]
  def change
    create_table :estacionamientoservicios do |t|
      t.decimal :tarifa
      t.references :estacionamiento, foreign_key: true
      t.references :serviciosadicionale, foreign_key: true

      t.timestamps
    end
  end
end
