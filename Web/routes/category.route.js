import express from 'express';
import categoryModel from '../models/category.model.js';

const router = express.Router();

router.get('/', async function (req, res) {
  const list = await categoryModel.findAll();
  res.render('home', {
    categories: list
  });
});

router.get('/add', function (req, res) {
  res.render('vwCategory/add');
}); 

export default router;