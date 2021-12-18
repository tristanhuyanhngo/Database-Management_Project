import driveModel from "./drive.model.js";

export function paging(req, res) {
    res.render("home")
}

export function table(req, res) {
    res.render("table")
}

export function one(req, res) {
    res.render("one")
}

// export function login(req, res) {
//     loginModel.checkLogin(req.query,(e,data)=>{
//         res.render("home",{id:data.id})
//     })
// }