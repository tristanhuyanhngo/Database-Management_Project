import express from 'express';
import { paging } from './staff.controller.js';

const router = express.Router();

router.get('/', paging);

export default router;