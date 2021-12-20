import express from 'express';
import {paging, order_list, order_one, received_list, received_one} from './drive.controller.js';
const router = express.Router();

router.get('/', paging);
router.get('/home',function (req, res) {
    res.render('drive/views/home');
});

//NOT RECEIVED ORDER LIST
router.get('/order_list', order_list);
router.get('/order_list/:id', order_one);

//DRIVER RECEIVED LIST
router.get('/received_list',received_list);
router.get('/received_list/:id',received_one);
export default router;

