import express from 'express';
import {mail, paging, pendingContract, renewalContract, updateDate, updateState} from './staff.controller.js';

const router = express.Router();

router.get('/', paging);
router.get('/review_contract',pendingContract);
router.get('/extend_contract',renewalContract);

//Viết hàm xử lý trong đây luôn
router.get('/update',updateState);
router.get('/update_time',updateDate)

//Route chỉ để render trang gửi mail, function update db thì viết router. khác
router.get('/mail/:id/:msg',mail)
export default router;
