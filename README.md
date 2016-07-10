# BikeLab

<img src="https://raw.githubusercontent.com/sighmon/bikelab/master/bikelab.jpg" width="100%" />

Air quality sensor data showing what you're breathing when you're cycling.

Data is collected [from an Arduino](https://github.com/sighmon/bike_air_quality_sensors), sent via bluetooth to an [iOS app](https://github.com/sighmon/BikeAirQualitySensorsiOS), and then validated, adding location data and passed to this Rails 5 app.

[Chart.js](http://www.chartjs.org) is plotting the data updates live via [Action Cable](http://guides.rubyonrails.org/action_cable_overview.html).

## Built at RailsCamp

Shout out and special thanks to Lauren and everyone who organised the awesome [RailsCamp 19 in Adelaide](http://lkhennessy.github.io/rails-camp/).

Great talks, lovely people. x