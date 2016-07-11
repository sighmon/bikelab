# BikeLab

Air quality sensor data showing what you're breathing when you're cycling.

Data is collected [from an Arduino](https://github.com/sighmon/bike_air_quality_sensors), sent via bluetooth to an [iOS app](https://github.com/sighmon/BikeAirQualitySensorsiOS), and then validated, adding location data and passed to this Rails 5 app.

[Chart.js](http://www.chartjs.org) is plotting the data updates live via [Action Cable](http://guides.rubyonrails.org/action_cable_overview.html).

Made with [Pix](https://github.com/thatpixguy).

<img src="https://raw.githubusercontent.com/sighmon/bikelab/master/bikelab.jpg" width="100%" />

## Try for yourself?

Clone this repository.

Then in the app root run:

```$ bundle```

```$ rails db:migrate```

```$ rails db:seed```

To simulate sending data from the iOS app to the server:

```$ curl -d 'reading[temperature]=21.3&reading[humidity]=46.7&reading[particles]=123.45&reading[carbon_monoxide]=609.4&reading[heater_on]=1&reading[device_id]=2&reading[timestamp]=2016-07-09 03:30:00 UTC&reading[latitude]=0.0487498275&reading[longitude]=-0.0487498275' http://localhost:3000/readings```

Have your terminal window side by side with a browser open at ```http://localhost:3000```, send a few different values and see the chart update live! :-)

## Built at RailsCamp

Shout out and special thanks to Lauren and everyone who organised the awesome [RailsCamp 19 in Adelaide](http://lkhennessy.github.io/rails-camp/).

Great talks, lovely people. x