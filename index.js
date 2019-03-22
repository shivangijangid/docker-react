//requiring in express library that we marked as a dependency in json
const express = require('express');
//use express library to create a new app
const app = express();
// any time someone visits a route application i will get a response how are you doing
app.get('/', (req, res) => {
  res.send('How are you doing');
});
//listening the app to the port 8080 which is inside the container
app.listen(8080, () => {
  console.log('Listening on port 8080');
});
