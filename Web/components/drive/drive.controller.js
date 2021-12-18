import driveModel from "./drive.model.js";

export function paging(req, res) {
  res.render("home");
}

export function table(req, res) {
  const area_id = "123";
  driveModel.getOrder("Gia Lai",(e, data) => {
      console.log(data)
    res.render("table",{orders:data, area_id});
  });
}

export function one(req, res) {
  res.render("one");
}
