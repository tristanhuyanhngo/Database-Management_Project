import loginModel from "./login.model.js";

export function paging(req, res) {
  res.render('login/views/login');
}

export function login(req, res) {
  loginModel.checkLogin(req.body, (e, data) => {
    if (data != undefined && data != null) {
      console.log(data)
      res.redirect("/");
    } else {
      res.status(404).json({ errors: "error" });
    }
  });
}
