const Khachhang = require("../models/khachhangModel");
var khModel = new Khachhang();

//Đặt hàng của khách hàng
exports.dh = (req, res) => {
    khModel.dathang(req.body.thongtindonhang,req.body.chitietdonhang, (e, data) => {
    res.send({ result: data, error: e });
  });
};

//xem danh sách sản phẩm của đối tác 
exports.xdsspcdt = (req, res) => {
  khModel.xemdanhsachsanphamcuadoitac(req.params.id, (e, data) => {
  res.send({ result: data, error: e });
});
};