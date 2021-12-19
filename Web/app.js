import express from 'express';
import bodyParser from 'body-parser';

// Middleware
import activate_view_middleware from './middlewares/view.mdw.js';
import activate_route_middleware from './middlewares/routes.mdw.js';

const app = express();

activate_view_middleware(app);
activate_route_middleware(app);

app.use(bodyParser.json())
app.use(express.urlencoded({extended: true}));


const port = 3000;
app.listen(port, function () {
  console.log(`Example app listening at http://localhost:${port}`);
});
