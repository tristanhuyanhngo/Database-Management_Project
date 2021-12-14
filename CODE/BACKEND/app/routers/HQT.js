module.exports = (app) => {
    const nvControl = require("../controllers/nhanvienController")
    app.get('/nhanvien/kthd',nvControl.kthd)
    app.post('/nhanvien/vtb',nvControl.vtb)

    const dtControl = require("../controllers/doitacController")
    app.post('/doitac/lhd', dtControl.lhd)
    app.get('/doitac/dssp/:id', dtControl.dssp)

    const txControl = require("../controllers/taixeController")
    app.get('/taixe/xdsdh/:kv', txControl.xdsdh)

    const khControl = require("../controllers/khachhangController")
    app.post('/khachhang/dh', khControl.dh)
    app.get('/khachhang/xdsspcdt/:id', khControl.xdsspcdt)
  };