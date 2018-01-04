# Weather Fetcher

## Description

Weather fetcher is an app built in Ruby on Rails that displays weather at different geographic locations. It uses Open Weather Map JSON API to get realtime weather data.

## Demo

A demo of the app can be found hosted on Heroku: https://weather-fetcher.herokuapp.com/

## Instructions:

- Run bundle install: ```bundle install```
- Create database: ```rake db:create```
- Enter the API key for using the Open Weather Map JSON API in config/secrets.yml. A free API key can be obtained by signing up at https://openweathermap.org/api
- To run unit tests: ```rails test```
- To run sytem tests: ```rails test:system```
- Run rails server: ```rails s```
- Access the web application at localhost:3000

## Improvements Roadmap:

- The tests currently are making actual requests for getting the weather from the API. These web requests need to be stubbed. Mocking these web requests need to be implemented using VCR or Webmock.
- The app currently does not need a database and hence it needs to be configured to be used without a databse and active record. Since it's not configured to work without a database, the db create command needs to be run.
- A typeahead can be introduced for city and country for improved performance and user experienc. The list of cities and country codes can be stored for that purpose.
- The presentation of weather information for a city is currently in the view. It needs to be moved to a decorator.
- Caching needs to be enabled for the weather data fetched from the API.
