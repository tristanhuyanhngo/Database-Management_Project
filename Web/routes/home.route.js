import express from 'express';
import { paging } from '../controllers/home.controller.js';
const router = express.Router();

router.get('/', paging);

export default router;