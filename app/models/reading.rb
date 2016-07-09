class Reading < ApplicationRecord
  validates_presence_of :temperature
  validates_presence_of :humidity
  validates_presence_of :particles
  validates_presence_of :carbon_monoxide
  # validates_presence_of :heater_on
  validates_presence_of :device_id
  validates_presence_of :timestamp
  validates_presence_of :latitude
  validates_presence_of :longitude
end
