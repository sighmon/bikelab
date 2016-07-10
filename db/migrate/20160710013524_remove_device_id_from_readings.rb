class RemoveDeviceIdFromReadings < ActiveRecord::Migration[5.0]
  def change
    remove_column :readings, :device_id, :integer
  end
end
