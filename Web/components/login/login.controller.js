import loginModel from "./login.model.js";
import store from "store";

export function paging(req, res) {
  res.render("login/views/login");
}

export function login(req, res) {
  loginModel.checkLogin(req.body, (e, data) => {
    if (data != undefined && data != null) {

      //quản trị
      if (data.type === 1) {
        res.redirect("/");
      }

      //đối tác
      else if (data.type === 2) {
        res.redirect("/");
      }

      //khách hàng
      else if (data.type === 3) {
        res.redirect("/");
      }
      
      //tài xế
      else if (data.type === 4) {
        loginModel.getInforDrive(data.id,(e,data2)=>{
          store.set("user",data2)
        })
        res.redirect("/");
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
