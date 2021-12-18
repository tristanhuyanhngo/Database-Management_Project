import express from 'express';
import { driver,customer,partner } from '../controllers/register.controller.js';
const router = express.Router();

router.get('/driver', driver);
router.get('/customer', customer);
router.get('/partner', partner);

export default router;