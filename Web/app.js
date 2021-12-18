import express from 'express';
import morgan from 'morgan';
import { dirname } from 'path';
import { fileURLToPath } from 'url';
export const __dirname = dirname(fileURLToPath(import.meta.url));

import activate_view_middleware from './middlewares/view.mdw.js';
import bodyParser from 'body-parser';
//import activate_route_middleware from './middlewares/routes.mdw.js';

const app = express();

import loginRouter from './components/login/login.route.js'
import registerRouter from './components/register/register.route.js'
import homeRouter from './components/home/home.route.js'
import driveRouter from './components/drive/drive.route.js'

activate_view_middleware(app);
app.use(bodyParser.json())
app.use(morgan('dev'));
app.use(express.urlencoded({extended: true}));

app.use('/', homeRouter);
app.use('/public', express.static('public'));
app.use('/login',loginRouter)
app.use('/register',registerRouter)
app.use('/drive',driveRouter)

const port = 3000;
app.listen(port, function () {
  console.log(`Example app listening at http://localhost:${port}`);
});
