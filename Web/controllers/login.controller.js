import loginModel from "../models/login.model.js";

export function paging(req, res) {
    res.render("login")
}

export function login(req, res) {
    loginModel.checkLogin(req.body,(e,data)=>{
        if(!e)  
        res.render("home",{id:data.id})
    })
}