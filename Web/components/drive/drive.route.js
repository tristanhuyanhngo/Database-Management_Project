import express from 'express';
import {paging,table,one} from './drive.controller.js';
const router = express.Router();

router.get('/', paging);
router.get('/table', table);
router.get('/one', one);

export default router;