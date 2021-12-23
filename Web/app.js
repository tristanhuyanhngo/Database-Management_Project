import express from 'express';
import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import flash from 'express-flash';

// Middleware
import activate_view_middleware from './middlewares/view.mdw.js';
import activate_route_middleware from './middlewares/routes.mdw.js';
import activate_session_middleware from './middlewares/session.mdw.js';

const app = express();

app.use(bodyParser.json())
app.use(express.urlencoded({extended: true}));
app.use(cookieParser());

activate_view_middleware(app);
activate_session_middleware(app);
app.use(flash());
activate_route_middleware(app);

const port = 3000;
app.listen(port, function () {
  console.log(`Example app listening at http://localhost:${port}`);
});
