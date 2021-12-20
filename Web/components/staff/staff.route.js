import express from 'express';
import {paging, pendingContract, renewalContract, updateDate, updateState} from './staff.controller.js';

const router = express.Router();

router.get('/', paging);
router.get('/review_contract',pendingContract);
router.get('/extend_contract',renewalContract);

router.get('/update',updateState);
router.get('/update_time',updateDate)
export default router;
