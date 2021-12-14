const Nhanvien = require("../models/nhanvienModel");
var nvModel = new Nhanvien();

//kiểm tra hợp dồng của Nhân viên
exports.kthd = (req, res) => {
    nvModel.kiemtrahopdong((e, data) => {
    res.send({ result: data, error: e });
  });
};

//Viết Thông báo
exports.vtb = (req, res) => {
    nvModel.vietthongbao(req.body.ND, req.body.ID,(e, data) => {
    res.send({ result: data, error: e });
  });
};