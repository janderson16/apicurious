# PogHogs

## About the app

APICurious is a personalized GitHub interface that provides users' with highlights reel of their GitHub activity without any of that pesky code. User's can access a list of their lastest commits, repositories, organizations, followers, people following them, as well as all GitHub activity for them. There's also a link to the real GitHub in case you feel like doing some actual work. It uses the Faraday gem to hit GitHub's API. It makes use of GitHub's OAuth service to log in and provide a user token that's attached to query parameters. A PostgreSQL database was used to store user data.

[Production link](https://warm-ocean-46875.herokuapp.com/)

#### Stack
* Ruby 2.3.0
* Rails 5.0.2
* RSpec test suite w/ Capybara
* BCrpyt


## Setup

1. Clone down the repository
```$ git clone git@github.com:janderson16/apicurious.git```
1. Bundle
```$ bundle install```
1. Create database
```$ rake db:create```
1. Migrate
```$ rake db:migrate``` 
1. Seed
```$ rake db:seed```
#### Run Locally
1. Start server
```$ rails s```
1. visit localhost in broswer
```localhost:3000``` 

#### Run Test Suite

1. ```$ rake db:test:prepare```
1. ```$ rspec```

---
