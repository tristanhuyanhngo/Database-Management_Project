import registerModel from "./register.model.js";

export function driver(req, res) {
    res.render("driver_register")
}

export function driverRegiste(req, res) {
    registerModel.driverRegister(req.body,(e,data)=>{
        res.render("driver_register")
    })
}

export function customer(req, res) {
    res.render("customer_register")
}

export function partner(req, res) {
    res.render("partner_register")
}

