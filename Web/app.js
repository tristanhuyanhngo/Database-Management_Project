import express from 'express';
import morgan from 'morgan';
import { engine } from 'express-handlebars';
import { dirname } from 'path';
import { fileURLToPath } from 'url';
import categoryRoute from './routes/category.route.js';

const __dirname = dirname(fileURLToPath(import.meta.url));

import activate_view_middleware from './middlewares/view.mdw.js';
//import activate_route_middleware from './middlewares/routes.mdw.js';

const app = express();

activate_view_middleware(app);

app.use(morgan('dev'));
app.use(express.urlencoded({
  extended: true
}));


app.get('/', function (req, res) {
  // res.send('Hello World!');
  res.render('home');
});

app.use('/public', express.static('public'));

//PA test
app.get('/add',function (req,res){
  res.render('add_account');
})

app.get('/login',function (req,res){
  res.render('login');
})

app.get('/register/customer',function (req,res){
  res.render('customer_register');
})

app.get('/register/partner',function (req,res){
  res.render('partner_register');
})

app.get('/register/driver',function (req,res){
  res.render('driver_register');
})

const port = 3000;
app.listen(port, function () {
  console.log(`Example app listening at http://localhost:${port}`);
});
