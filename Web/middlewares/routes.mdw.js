import express from "express";

import loginRouter from '../components/login/login.route.js'
import registerRouter from '../components/register/register.route.js'
import homeRouter from '../components/home/home.route.js'
import driveRouter from '../components/drive/driver.route.js'
import customerRouter from '../components/customer/customer.route.js'
import partnerRouter from '../components/partner/partner.route.js'
import staffRouter from '../components/staff/staff.route.js'

import path from 'path';
import { dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

export default function (app) {
    app.use('/', homeRouter);
    app.use('/login',loginRouter)
    app.use('/register',registerRouter)
    app.use('/drive',driveRouter)
    app.use('/staff',staffRouter)
    app.use('/customer', customerRouter);
    app.use('/partner', partnerRouter);
    app.use('/public', express.static('public'));
    app.use(express.static(path.join(__dirname, 'public')))
};
