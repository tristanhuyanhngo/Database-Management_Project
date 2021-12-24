import express from 'express';
import customerModel from './customer.model.js'

const router = express.Router();

router.get('/',function (req, res) {
    res.render('customer/views/home');
});

router.get('/order_list', async function (req, res) {
    const orders = await customerModel.findOrdersByCustomerID(4);
    const customer_name = await customerModel.findCustomerByID(4);

    res.render('customer/views/order_list', {
        orders,
        customer_name
    });
});

export default router;

