# Koroibos Olympic API

[![Build Status](https://travis-ci.com/lrs8810/olympic_api.svg?branch=master)](https://travis-ci.com/lrs8810/olympic_api)

### Introduction
### Jump To
- [Initial Setup](#initial-setup)
- [How to Use](#how-to-use)
- [Known Issues](#known-issues)
- [Running Tests](#running-tests)
- [Initial Setup](#initial-setup)
- [How to Contribute](#how-to-contribute)
- [Core Contributors](#core-contributors)
- [Schema Design](#schema-design)
- [Tech Stack List](#tech-stack-list)

### Initial Setup
Run the following command to import the olympic_data_2016.csv file:
```
rake import:olympics
```
### How to Use
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

### Known Issues
### Running Tests
### How to Contribute
### Core Contributors
- [Laura Schulz](https://github.com/lrs8810)

### Schema Design
<img width="609" alt="Screen Shot 2020-03-02 at 6 49 23 AM" src="https://user-images.githubusercontent.com/30582885/75682066-08a00580-5c52-11ea-8eff-04bafd6c29ee.png">

### Tech Stack List
