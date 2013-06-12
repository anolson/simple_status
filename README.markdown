# Simple Status

A simple status page that displays the current system status and a status history (a la [GitHub Status](http://status.github.com)).

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

### Update status message and current status.
```
  $ curl http://localhost:3000/api/current_status \
    -X PUT \
    -d status=up
    -d "message[body]=All systems go" \
```

### Update only the status message
```
  $ curl http://localhost:3000/api/current_status
    -X PUT \
    -d "message[body]=All systems go"
```

### Update only the status
```
  $ curl http://localhost:3000/api/current_status
    -X PUT
    -d status=down
```