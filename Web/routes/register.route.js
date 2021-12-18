import express from 'express';
import { driver,customer,partner,
        driverRegiste } from '../controllers/register.controller.js';
const router = express.Router();

router.get('/driver', driver);
router.post('/driver', driverRegiste)

router.get('/customer', customer);


router.get('/partner', partner);

export default router;