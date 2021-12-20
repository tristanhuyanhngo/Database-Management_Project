import express from 'express';
import {paging, pendingContract, renewalContract} from './staff.controller.js';

const router = express.Router();

router.get('/', paging);
router.get('/review_contract',pendingContract);
router.get('/extend_contract',renewalContract);
export default router;
