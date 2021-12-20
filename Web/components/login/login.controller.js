import loginModel from "./login.model.js";
import store from "store";

export function paging(req, res) {
  res.render("login/views/login");
}

export async function login(req, res) {
  await loginModel.checkLogin(req.body, (e, data) => {
    if (data != undefined && data != null) {
      //quản trị
      if (data.type === 1) {
        res.redirect("/");
      }

      //đối tác
      else if (data.type === 2) {
        loginModel.getInforPartner(data.id, (e, data2) => {
          store.set("user", data2);
          res.redirect("/partner");
        });
      }

      //khách hàng
      else if (data.type === 3) {
        loginModel.getInforCustomer(data.id, (e, data2) => {
          store.set("user", data2);
          res.redirect("/customer");
        });
      }

      //tài xế
      else if (data.type === 4) {
        loginModel.getInforDriver(data.id, (e, data2) => {
          store.set("user", data2);
          res.redirect("/drive");
        });
      }

      //Nhân viên
      else if (data.type === 5) {
        res.redirect("/");
      }
    } else {
      res.redirect("/login");
    }
  });
}
