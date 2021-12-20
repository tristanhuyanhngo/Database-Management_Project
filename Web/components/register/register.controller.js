import registerModel from "./register.model.js";

export function driver(req, res) {
  res.render("register/views/driver_register");
}

export function driverRegister(req, res) {
  registerModel.driverRegister(req.body, (e, data) => {
    if (!e) req.flash("mess", "Đăng ký thành công");
    else req.flash("mess", "Đăng ký thất bại");
    res.redirect("/register/driver");
  });
}

export function customer(req, res) {
  res.render("register/views/customer_register");
}

export function customerRegister(req, res) {
  registerModel.customerRegister(req.body, (e, data) => {
    if (!e) req.flash("mess", "Đăng ký thành công");
    else req.flash("mess", "Đăng ký thất bại");
    res.redirect("/register/customer");
  });
}

export function partner(req, res) {
  res.render("register/views/partner_register");
}

export function partnerRegister(req, res) {
  registerModel.partnerRegister(req.body, (e, data) => {
    if (!e) req.flash("mess", "Đăng ký thành công");
    else req.flash("mess", "Đăng ký thất bại");
    res.redirect("/register/partner");
  });
}