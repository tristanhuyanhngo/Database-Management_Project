import express from "express";
import loginRouter from '../components/login/login.route.js'
import registerRouter from '../components/register/register.route.js'
import homeRouter from '../components/home/home.route.js'
import driveRouter from '../components/drive/drive.route.js'


export default function (app) {
    app.use('/', homeRouter);
    app.use('/login',loginRouter)
    app.use('/register',registerRouter)
    app.use('/drive',driveRouter)
    app.use('/public', express.static('public'));

}
