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

