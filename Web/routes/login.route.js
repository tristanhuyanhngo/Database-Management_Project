import express from 'express';
import { paging,login } from '../controllers/login.controller.js';
const router = express.Router();

router.get('/', paging);
router.post('/log', login);

export default router;