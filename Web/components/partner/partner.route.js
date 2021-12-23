import express from 'express';

const router = express.Router();

router.get('/',function (req, res) {
    res.render('partner/views/home');
});

export default router;

