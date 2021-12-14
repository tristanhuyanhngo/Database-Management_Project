import express from 'express';
import categoryModel from '../models/category.model.js';

const router = express.Router();

router.get('/', async function (req, res) {
  const list = await categoryModel.findAll();
  res.render('vwCategory/index', {
    categories: list
  });
});

router.get('/add', function (req, res) {
  res.render('vwCategory/add');
});

router.post('/add', async function (req, res) {
  //console.log(req.body);
  const ret = await categoryModel.add(req.body);
  // console.log(ret);
  res.render('vwCategory/add');
});

export default router;