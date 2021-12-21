import staffModel from "./staff.model.js";

export function paging(req, res) {
  res.render("home/views/home");
}

export function pendingContract(req, res) {
  staffModel.pendingContract((e, data) => {
    res.render("staff/views/contract_review", { data });
  });
}

export function renewalContract(req, res) {
  staffModel.renewalContract((e, data) => {
    res.render("staff/views/contract_renew", { data });
  });
}
export function updateState(req, res) {
  staffModel.updateState(req.query.idVal, (e, data) => {
    res.redirect("/staff/review_contract/");
  });
}

export function updateDate(req, res) {
  staffModel.updateDate(req.query.idVal, req.query.retVal, (e, data) => {
    res.redirect("/staff/extend_contract/");
  });
}

export function mail(req, res) {
  //Mã hợp đồng
  const id = req.params.id;
  //Lấy ra mã partner của hợp đồng
  const partner = "Hehe";
  //Biến PA dùng để viết thông báo bên FE
  const type = req.params.msg;
  var msg;
  if (type === 1) msg = "review and accepted";
  else msg = "extended";

  res.render("staff/views/mail", { msg, partner, id });
}
