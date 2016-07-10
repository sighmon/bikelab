class AddDeviceToReadings < ActiveRecord::Migration[5.0]
  def change
    add_reference :readings, :device, foreign_key: true
  end
end
