import express from 'express';
import customerModel from './customer.model.js'
import store from "store";

const router = express.Router();

router.get('/',function (req, res) {
    const info = store.get('user');
    res.render('customer/views/home', {
        info
    });
});

router.get('/order_list/:id', async function (req, res) {
    const CusID = req.params.id || 0;
    console.log(CusID);
    const orders = await customerModel.findOrdersByCustomerID(4);

    if (orders === undefined) {
        return res.redirect('/');
    }

    const customer_name = await customerModel.findCustomerByID(4);

    res.render('customer/views/order_list', {
        orders,
        customer_name
    });
});

export default router;

