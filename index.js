//requiring in express and redis java libraries
const express = require('express');
const redis = require('redis');

//count number of visits to the application
//redis is used here to store the number of visits
const app = express();
const client = redis.createClient({
  host: 'redis-server',
  port: 6379
}); //this is going to connect to redis-server container defined in docker-compose.yml
client.set('visits', 0);

app.get('/', (req, res) => {
  client.get('visits', (err, visits) => {
    res.send('Number of visits is ' + visits);
    client.set('visits', parseInt(visits) + 1);
  });
});

app.listen(8081, () => {
  console.log('Listening on port 8081');
});
