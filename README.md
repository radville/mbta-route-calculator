# README

This application retrieves data from the [MBTA service API](https://api-v3.mbta.com/docs/swagger/index.html). 


### Installing & Using the Application

To get a development environment running:

1. Clone this repo to your local machine with `https://github.com/radville/mbta-route-calculator` 

2. Run `bundle install` to add all gems from the Gemfile

3. Create and initialize the postgres database by running `rails db:create` and then `rails db:migrate`

4. Test models with `rspec spec/models/route_spec.rb` and `run with rspec spec/models/stop_spec.rb`

5. Load the development site by entering `rails s` in the terminal. 

6. To display Light Rail and Heavy Rail routes, the route with the most stops, and the route with the fewest stops, navigate to `localhost:3000/routes`. When using the app for the first time, navigate to this page first to populate the database.

7. Next, to calculate routes between stops, go to `http://localhost:3000`.



### Decisions
If this is the first time cloning and installing the project, you must first go to `localhost:3000/routes` to fetch route data from the MBTA API. To see all MBTA light rail and heavy rail routes, go to localhost:3000/routes. The request is made from `https://api-v3.mbta.com/routes?filter[type]=0,1` in order to only get data for these two rail types. Without filtering the request, it pulls more data than is necessary for this application.


## Built With

* Ruby 2.6.1

* [Ruby on Rails](https://rubyonrails.org/) - The web framework used


## Contributing

1. Fork this repo

2. Clone the repo to your local machine with `https://github.com/radville/mbta-route-calculator`

3. Make your edits!

4. Create a new pull request


## Authors

* **Laura Radville** - *Initial work* - (https://github.com/radville/)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details