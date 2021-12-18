import loginModel from "../models/login.model.js";

export function paging(req, res) {
  res.render("login");
}

export function login(req, res) {
  loginModel.checkLogin(req.body, (e, data) => {
    if (data != undefined && data != null) {
      res.locals.id = data.id;
      res.redirect("/");
    } else {
      res.status(404).json({ errors: "error" });
    }
  });
}
