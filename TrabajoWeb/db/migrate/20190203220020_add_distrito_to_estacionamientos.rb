class AddDistritoToEstacionamientos < ActiveRecord::Migration[5.2]
  def change
  	add_column :Estacionamientos, :distrito, :string
  end
end
