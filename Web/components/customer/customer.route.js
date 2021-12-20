import express from 'express';

const router = express.Router();

router.get('/home',function (req, res) {
    res.render('customer/views/home');
});

export default router;

