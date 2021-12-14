const Taixe = require("../models/taixeModel");
var txModel = new Taixe();

//xem danh sách đơn hàng chưa được chọn thuộc khu vực của tài xế
exports.xdsdh = (req, res) => {
    txModel.xemdanhsachdonhang(req.params.kv, (e, data) => {
    res.send({ result: data, error: e });
  });
};