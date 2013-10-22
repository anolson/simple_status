# Simple Status

A simple status page that displays the current system status and a status history (inspired by [GitHub Status](http://status.github.com)).

[![Code Climate](https://codeclimate.com/github/anolson/simple_status.png)](https://codeclimate.com/github/anolson/simple_status)
[![Build Status](https://travis-ci.org/anolson/simple_status.png?branch=master)](https://travis-ci.org/anolson/simple_status)

## Getting started
```sh
$ git clone git://github.com/anolson/simple_status.git
$ cd simple_status
$ bundle
$ bundle exec rake db:setup
```

### Start the server
```sh
$ bundle exec rails s
```

### Run the specs
```sh
$ bundle exec guard
```

## Status API

### Get current status

Get the current status.

**Request**
```sh
$ curl http://localhost:3000/api/current_status
```

**Response**
```json
{
  "state": "up",
  "last_updated": "2013-06-12T02:29:00Z"
}
```

### Update current status with a message

Update the current status with a message.  Valid states are either `up` or `down`.

**Request**
```sh
$ curl http://localhost:3000/api/current_status \
  -X PUT \
  -d state=up \
  -d "message[body]=All systems go"
```

**Response**
```json
{
  "state": "up",
  "last_updated": "2013-06-12T02:29:00Z"
}
```

### Touch the current status

Simply update the current status `last_updated`.

**Request**
```sh
$ curl http://localhost:3000/api/current_status/touch \
  -X PUT
```

**Response**
```json
{
  "state": "up",
  "last_updated": "2013-06-12T02:40:27Z"
}
```

### Create status message

**Request**
```sh
$ curl http://localhost:3000/api/messages \
  -X POST \
  -d "message[body]=Still performing db maintenance"
```

**Response**
```json
{
  "body": "Still performing db maintenance",
  "created_at": "2013-06-12T03:32:08Z",
  "state": "down"
}
```

### List status messages

**Request**
```sh
$ curl http://localhost:3000/api/messages
```

**Response**
```json
[
  {
    "body": "Still performing db maintenance",
    "created_at": "2013-06-12T03:32:08Z",
    "state": "down"
  }
]
```
