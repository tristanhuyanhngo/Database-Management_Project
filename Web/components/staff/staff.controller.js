import staffModel from "./staff.model.js";

export function paging(req, res) {
  res.render("staff/views/home");
}

export function pendingContract(req, res) {
  staffModel.pendingContract((e, data) => {
    res.render("staff/views/contract_review", { data });
  });
}

export function renewalContract(req, res) {
  staffModel.renewalContract((e, data) => {
    res.render("staff/views/contract_renew", { data:data[0], DHHH:data[1][0].SoLuongHopDongHetHan });
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
  staffModel.mail(req.params.id, (e, data) => {
    res.render("staff/views/mail", {
      partner: data.name,
      iddt: data.id,
      idhd: req.params.id,
    });
  });
}

export function sendMail(req, res) {
  staffModel.sendMail(req.params.id, req.body.msg, (e, data) => {
    res.redirect("/staff/extend_contract");
  });
}
