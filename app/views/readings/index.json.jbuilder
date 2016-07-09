json.array!(@readings) do |reading|
  json.extract! reading, :id, :temperature, :humidity, :particles, :carbon_monoxide, :heater_on, :device_id, :timestamp, :latitude, :longitude
  json.url reading_url(reading, format: :json)
end
