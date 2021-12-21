import express from 'express';
import {mail, paging, pendingContract, renewalContract, updateDate, updateState, sendMail} from './staff.controller.js';

const router = express.Router();

router.get('/', paging);
router.get('/review_contract',pendingContract);
router.get('/extend_contract',renewalContract);

router.get('/update',updateState);
router.get('/update_time',updateDate)

router.get('/mail/:id',mail)
router.post('/mail/:id',sendMail)
export default router;
