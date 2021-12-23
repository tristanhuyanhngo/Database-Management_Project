import express from 'express';
import {paging, order_list, order_one, received_list, received_one} from './driver.controller.js';
const router = express.Router();

router.get('/home', paging);

//NOT RECEIVED ORDER LIST
router.get('/order_list', order_list);
router.get('/order_list/:id', order_one);
router.post('/order_list/:id', order_one);

//DRIVER RECEIVED LIST
router.get('/received_list',received_list);
router.get('/received_list/:id',received_one);
export default router;

