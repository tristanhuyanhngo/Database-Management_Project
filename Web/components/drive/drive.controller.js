import driveModel from "./drive.model.js";

export function paging(req, res) {
  res.render("home/views/home");
}

export function order_list(req, res) {
  const area_id = "123";
  driveModel.getOrder("Gia Lai",(e, data) => {
    res.render("drive/views/order_list",{orders:data, area_id});
  });
}

export function order_one(req, res) {
  driveModel.getOrderByID(req.params.id,(e, data)=>{
    res.render("drive/views/order_one",{one:data});
  })

}

export function received_list(req,res) {
  driveModel.getDriverOrder("1",(e,data)=>{
    res.render("drive/views/received_list", {orders:data});
  })

}

export function received_one(req,res) {
  driveModel.getOrderByID(req.params.id,(e,data)=>{
    res.render("drive/views/received_one",{one:data});
  })

}
