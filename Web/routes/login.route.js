import express from 'express';
import { paging,login } from '../controllers/login.controller.js';
const router = express.Router();

router.get('/', paging);
router.get('/log', login);
// localhost:300/login/log
export default router;