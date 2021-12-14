const Doitac = require("../models/doitacModel");
var dtModel = new Doitac();

//Lập hợp đồng của đối tác
exports.lhd = (req, res) => {
    dtModel.laphopdong(req.body.ID, req.body.SNC, (e, data) => {
    res.send({ result: data, error: e });
  });
};

//xem danh sách sản phẩm của đối tác
exports.dssp = (req, res) => {
    dtModel.danhsachsanpham(req.params.id, (e, data) => {
    res.send({ result: data, error: e });
  });
};