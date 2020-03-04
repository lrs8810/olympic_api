# Koroibos Olympic API

[![Build Status](https://travis-ci.com/lrs8810/olympic_api.svg?branch=master)](https://travis-ci.com/lrs8810/olympic_api)

### Introduction
The Koroibos Olympic API is a take home challenge for the Koroibos organization. The API exposes 6 endpoints which each aggregate data for olympians and events based on 2016 Olympics data provided via a CSV file.
### Jump To
- [Initial Setup](#initial-setup)
- [How to Use](#how-to-use)
- [Known Issues](#known-issues)
- [Running Tests](#running-tests)
- [Initial Setup](#initial-setup)
- [Core Contributors](#core-contributors)
- [Project Board](#project-board)
- [Schema Design](#schema-design)
- [Tech Stack List](#tech-stack-list)

### Initial Setup
Clone the repo:
```
git clone git@github.com:lrs8810/olympic_api.git
```
Install dependencies:
```
bundle install
```
Setup the database:
```
rails db:create
rails db:migrate
```
Run the following command to import the olympic_data_2016.csv file:
```
rake import:olympics
```
If you would like to test the endpoints locally, you can do so by starting the server:
```
rails server
```
Then navigate to your browser and enter http://localhost:3000. Append any endpoints in the [How to Use](#how-to-use) section to make the requests.  
### How to Use
All six endpoints are `GET` requests. The API is available at https://olympic-2016-ls.herokuapp.com/ with any of the endpoints listed below. 
#### Olympians
##### Get List of All Olympians
`GET` to `/api/v1/olympians`

Example successful response:
```
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```
##### Get Youngest Olympian
`GET` to `/api/v1/olympians?age=youngest`

Example successful response:
```
{
  "olympians":
    [
      {
        "name": "Ana Iulia Dascl",
        "team": "Romania",
        "age": 13,
        "sport": "Swimming"
        "total_medals_won": 0
      }
    ]
}
```
##### Get Oldest Olympian
`GET` to `/api/v1/olympians?age=oldest`

Example successful response:
```
{
  "olympians":
    [
      {
        "name": "Julie Brougham",
        "team": "New Zealand",
        "age": 62,
        "sport": "Equestrianism"
        "total_medals_won": 0
      }
    ]
}
```
##### Get Olympian Stats
`GET` to `/api/v1/olympian_stats`

Example successful response:
```
{
  "olympian_stats": {
    "total_competing_olympians": 3120
    "average_weight:" {
      "unit": "kg",
      "male_olympians": 75.4,
      "female_olympians": 70.2
    }
    "average_age:" 26.2
  }
}
```
#### Events
##### Get List of All Events
`GET` to `/api/v1/events`

Example successful response:
```
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```
##### Get Medalists for a Specific Event
`GET` to `/api/v1/events/:id/medalists`

Example successful response:
```
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```
### Running Tests
To run tests use the following command:
```
rspec
```
If you would like to see the current test coverage use the following command:
```
open coverage/index.html
```
### Core Contributors
- [Laura Schulz](https://github.com/lrs8810)

### Project Board
- [Koroibos Olympic API Project Board](https://github.com/lrs8810/olympic_api/projects/1)

### Schema Design
<img width="609" alt="Screen Shot 2020-03-02 at 6 49 23 AM" src="https://user-images.githubusercontent.com/30582885/75682066-08a00580-5c52-11ea-8eff-04bafd6c29ee.png">

### Tech Stack List
- Ruby 2.4.1
- Rails 5.2.4
- RSpec 3.9
- PostgreSQL
- Travis-CI
- Heroku
