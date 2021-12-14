import express from 'express';
import morgan from 'morgan';
import { engine } from 'express-handlebars';

import { dirname } from 'path';
import { fileURLToPath } from 'url';

import categoryRoute from './routes/category.route.js';

const __dirname = dirname(fileURLToPath(import.meta.url));

const app = express();

app.use(morgan('dev'));
app.use(express.urlencoded({
  extended: true
}));

app.engine('hbs', engine({
  defaultLayout: 'layout.hbs'
}));

app.set('view engine', 'hbs');
app.set('views', './views');

app.get('/', function (req, res) {
  // res.send('Hello World!');
  res.render('home');
});

app.use('/admin/categories', categoryRoute);

//PA test
app.get('/add',function (req,res){
  res.render('add_account');
})

const port = 3000;
app.listen(port, function () {
  console.log(`Example app listening at http://localhost:${port}`);
});
