# README

This application retrieves data from the MBTA API. 

Created in Ruby 2.6.1. 

### Decisions
To see all MBTA light rail and heavy rail routes, go to localhost:3000/routes. I pull only these two types of routes when I make the request from https://api-v3.mbta.com/routes?filter[type]=0,1. Without filtering the request, it pulls more data than is necessary for this application.

### Installing & Using the Application

To get a development environment running:

1. Clone this repo to your local machine with `https://github.com/radville/mbta-route-calculator` 

2. Run `bundle install` to add all gems from the Gemfile

3. Create and initialize the postgres database by running `rails db:create` and then `rails db:migrate`

4. Load the development site by entering `rails s` in the terminal. 

5. To display Light Rail and Heavy Rail routes, the route with the most stops, and the route with the fewest stops, navigate to `localhost:3000/routes`. When using the app for the first time, navigate to this page first to populate the database.

6. Next, to calculate routes between stops, go to `http://localhost:3000`.



## Built With

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