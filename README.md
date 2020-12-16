Sweater Weather is a backend Rails API for a hypothetical weather & trip planning app that connects to the Mapquest, Open Weather, and Pixabay exernal APIs.

This project focuses on building and consuming API's.

<img src="https://backend.turing.io/module3/projects/sweater_weather/images/root.png">

[Original Project Page](https://backend.turing.io/module3/projects/sweater_weather/)<br>
[Technical Requirements](https://backend.turing.io/module3/projects/sweater_weather/requirements)

# Versions<br>
Ruby 2.5.3<br>
Rails 6.0.3<br>
PostgreSQL database<br>
RSpec for testing<br>

# Setup<br>
Fork & clone the repo<br>
Run bundle install<br>
Run rails db:{create,migrate}<br>
Run bundle exec figaro install<br>
Add your API keys to the newly created config/application.yml file. Reference the API Keys section below for compatible environment variable key naming.<br>
To run local test suite: bundle exec rspec<br>
All API responses in test suite are mocked using webmock and vcr gems with the exception of the tests under spec/services which test the original external API connections to three different sources.<br>

# Get Your Keys!<br>
Add these to your application.yml file:<br>

[Mapquest API](https://developer.mapquest.com/documentation/geocoding-api/)<br>
MAPQUEST_API_KEY: <api_key><br>

[Open Weather API](https://openweathermap.org/api/one-call-api)<br>
OPEN_WEATHER_API_ID: <api_key><br>

[Unsplase API](https://unsplash.com/developers)<br>
UNSPLASH_ACCESS_KEY: <api_key><br>

# Sweater Weather in Action!
- Make sure to spin up a local server for Sweater Weather before trying to run the requests in Postman.
- From the project directory, run rails s.
- The Postman collection below uses http://localhost:3000 as the base domain.
