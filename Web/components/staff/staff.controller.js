import staffModel from "./staff.model.js";

export function paging(req, res) {
  res.render("");
}

export function pendingContract(req, res) {
  staffModel.pendingContract((e, data) => {
  });
}

export function renewalContract(req, res) {
    staffModel.renewalContract((e, data) => {
    });
  }