# Simple Status

A simple status page that displays the current system status and a status history (inspired by [GitHub Status](http://status.github.com)).

## Getting started
```
  $ git clone git://github.com/anolson/simple_status.git
  $ cd simple_status
  $ bundle
  $ bundle exec rake db:setup
```

### Start the server
```
  $ bundle exec rails s
```

### Run the specs
```
  $ bundle exec guard
```

## API

Updating the system status message and current status.

### Update current status with a message

**Request**
```
  $ curl http://localhost:3000/api/current_status \
    -X PUT \
    -d status=up \
    -d "message[body]=All systems go"
```

**Response**
```json
{
  "status": "up",
  "last_updated": "2013-06-12T02:29:00Z"
}
```

### Update only the status

**Request**
```
  $ curl http://localhost:3000/api/current_status \
    -X PUT \
    -d status=down
```

**Response**
```json
{
  "status": "down",
  "last_updated": "2013-06-12T02:40:27Z"
}
```

### Create a new status message

**Request**
```
  $ curl http://localhost:3000/api/messages \
    -X POST \
    -d "message[body]=Still performing db maintenance"
```

**Response**
```json
{
  "body": "Still performing db maintenance",
  "created_at": "2013-06-12T03:32:08Z",
  "status": "down"
}
```

