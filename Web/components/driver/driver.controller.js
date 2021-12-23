import driveModel from "./driver.model.js";
import store from "store";

export function paging(req, res) {
  res.render("driver/views/home");
}

export function order_list(req, res) {
  const area_id = store.get("user").KhuVucHoatDong;
  driveModel.getOrder(area_id, (e, data) => {
    res.render("driver/views/order_list", { orders: data, area_id });
  });
}

export function order_one(req, res) {
  driveModel.getOrderByID(req.params.id, (e, data) => {
    res.render("driver/views/order_one", { one: data });
  });
}

export function get_order_one(req, res) {
  driveModel.get_order_one(req.params.id,store.get("user").MaTaiXe, (e, data) => {
    res.redirect("/driver/order_list")
  });
}

export function received_list(req, res) {
  const area_id = store.get("user").KhuVucHoatDong;
  driveModel.getDriverOrder(store.get("user").MaTaiXe, (e, data) => {
    res.render("driver/views/received_list", { orders: data, area_id });
  });
}

export function received_one(req, res) {
  driveModel.getOrderByID(req.params.id, (e, data) => {
    res.render("driver/views/received_one", { one: data });
  });
}

export function change_received_one(req, res) {
  driveModel.change_received_one(req.params.id,req.body.state, (e, data) => {
    res.redirect("/driver/received_list")
  });
}