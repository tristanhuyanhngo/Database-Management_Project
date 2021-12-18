import express from 'express';
import { driver,customer,partner,
        driverRegister } from './register.controller.js';
const router = express.Router();

router.get('/driver', driver);
router.post('/driver', driverRegister)

router.get('/customer', customer);

router.get('/partner', partner);

export default router;
