import registerModel from "../models/register.model.js";

export function driver(req, res) {
    res.render("driver_register")
}

export function customer(req, res) {
    res.render("customer_register")
}

export function partner(req, res) {
    res.render("partner_register")
}

// export function login(req, res) {
//     loginModel.checkLogin(req.query,(e,data)=>{
//         res.render("home",{id:data.id})
//     })
// }