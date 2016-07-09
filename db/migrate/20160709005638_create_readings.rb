class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.float :temperature
      t.float :humidity
      t.float :particles
      t.float :carbon_monoxide
      t.boolean :heater_on

      t.timestamps
    end
  end
end
