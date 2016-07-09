class AddDeviceIdAndTimestampAndLatitudeAndLongitudeToReadings < ActiveRecord::Migration[5.0]
  def change
    add_column :readings, :device_id, :integer
    add_column :readings, :timestamp, :datetime
    add_column :readings, :latitude, :float
    add_column :readings, :longitude, :float
  end
end
