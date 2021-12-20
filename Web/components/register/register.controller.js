import store from "store";
import registerModel from "./register.model.js";

export function driver(req, res) {
  res.render("register/views/driver_register");
}

export function driverRegister(req, res) {
  registerModel.driverRegister(req.body, (e, data) => {
    res.redirect("/register/register");
  });
}

export function customer(req, res) {
  res.render("register/views/customer_register");
}

export function partner(req, res) {
  res.render("register/views/partner_register");
}
