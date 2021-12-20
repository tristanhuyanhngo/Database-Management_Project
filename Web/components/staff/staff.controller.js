import staffModel from "./staff.model.js";

export function paging(req, res) {
  res.render("");
}

export function pendingContract(req, res) {
  staffModel.pendingContract((e, data) => {

      res.render("staff/views/contract_review",{data})
  });
}

export function renewalContract(req, res) {
    staffModel.renewalContract((e, data) => {
        res.render("staff/views/contract_renew",{data})
    });
}
export function updateState(req, res) {
    //nhận id của đơn hàng vào sửa trạng thái từ chờ duyệt => đã duyệt
    console.log(req.query.idVal);
    res.redirect('/staff/review_contract/');
}

export function updateDate(req, res) {
    //nhận id, "dd/mm/yy" của đơn hàng vào sửa ngày
    console.log(req.query.idVal);
    console.log(req.query.retVal)
    res.redirect('/staff/extend_contract/');
}

export function mail(req,res) {
    //Mã hợp đồng
    const id=req.params.id;
    //Lấy ra mã partner của hợp đồng
    const partner="Hehe";
    //Biến PA dùng để viết thông báo bên FE
    const type=req.params.msg;
    var msg;
    if (type===1) msg="review and accepted";
    else msg="extended";

    res.render('staff/views/mail',{msg, partner, id});
}
