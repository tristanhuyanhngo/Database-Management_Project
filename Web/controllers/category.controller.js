import categoryModel from "../models/category.model.js";

export function paging(req, res) {
  categoryModel.findAll((e, data) => {
    console.log(data)
    if(!e)
      res.render("home", {categories: data});
  });
}
