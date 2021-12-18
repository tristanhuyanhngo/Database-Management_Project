import driveModel from "./drive.model.js";

export function paging(req, res) {
  res.render("home");
}

export function table(req, res) {
  driveModel.getOrder("Gia Lai",(e, data) => {
      console.log(data)
    res.render("table",{orders:data});
  });
}

export function one(req, res) {
  res.render("one");
}
