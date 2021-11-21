import fetch from 'node-fetch'
import express from 'express'
const app = express();

app.get('/', function (req, res) {
    var url = 'https://jsonplaceholder.typicode.com/photos';

    fetch(url)
        .then(res => res.json())
        .then(data => {
            res.send({ data });
        })
        .catch(err => {
            res.send(err);
        });
});

app.listen(3001, () => {
    console.log('Server listening on port: ', 3001)
});