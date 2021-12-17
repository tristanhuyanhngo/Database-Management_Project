import categoryModel from "../models/category.model.js";

export function paging(req, res) {
  categoryModel.findAll((e, data) => {
    res.render("home", {categories: data});
  });
}
