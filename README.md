Sweater Weather is a backend Rails API for a hypothetical weather & trip planning app that connects to the Mapquest, Open Weather, and Pixabay exernal APIs.

This project focuses on building and consuming API's.

[https://backend.turing.io/module3/projects/sweater_weather/](Original-Project-Page)
[https://backend.turing.io/module3/projects/sweater_weather/requirements](Technical-Requirements)

Versions
Ruby 2.5.3
Rails 6.0.3
PostgreSQL database
RSpec for testing
Setup
Fork & clone the repo
Run bundle install
Run rails db:{create,migrate}
Run bundle exec figaro install
Add your API keys to the newly created config/application.yml file. Reference the API Keys section below for compatible environment variable key naming.
To run local test suite: bundle exec rspec
All API responses in test suite are mocked using webmock and vcr gems with the exception of the tests under spec/services which test the original external API connections to three different sources.
Get Your Keys!
Add these to your application.yml file:

Mapquest API
GEOCODING_API_KEY: <api_key>

Open Weather API
OPEN_WEATHER_API_KEY: <api_key>

Pixabay API
PIXABAY_API_KEY: <api_key>

Sweater Weather in Action!
Make sure to spin up a local server for Sweater Weather before trying to run the requests in Postman.
From the project directory, run rails s.
The Postman collection below uses http://localhost:3000 as the base domain.
