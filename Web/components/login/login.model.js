import db from "../../utils/db.js";

export default {
  async checkLogin(log,result) {
    try {
      const pool = await db.conn;
      const sqlstring =
       "select nguoidung as id, loainguoidung as type from taikhoan where TenDangNhap = @varDN and MatKhau = @varMK";
      return pool.request()
      .input("varDN",db.sql.VarChar, log.username)
      .input("varMK",db.sql.VarChar, log.pass)
      .query(sqlstring, (e, data2) => {
        if (data2.recordset.length>0) result(null, data2.recordset[0]);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  },

  async getInforDriver(id,result) {
    try {
      const pool = await db.conn;
      const sqlstring =
       "select * from taixe where mataixe = @varID";
      return pool.request()
      .input("varID",db.sql.Int, id)
      .query(sqlstring, (e, data) => {
        if (data.recordset.length>0) result(null, data.recordset[0]);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  },

  async getInforPartner(id,result) {
    try {
      const pool = await db.conn;
      const sqlstring =
       "select * from doitac where masothue = @varID";
      return pool.request()
      .input("varID",db.sql.Int, id)
      .query(sqlstring, (e, data) => {
        if (data.recordset.length>0) result(null, data.recordset[0]);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  },

  async getInforCustomer(id,result) {
    try {
      const pool = await db.conn;
      const sqlstring =
       "select * from khachhang where makhachhang = @varID";
      return pool.request()
      .input("varID",db.sql.Int, id)
      .query(sqlstring, (e, data) => {
        if (data.recordset.length>0) result(null, data.recordset[0]);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  },

  async getInforStaffr(id,result) {
    try {
      const pool = await db.conn;
      const sqlstring =
       "select * from nhanvien where nhanvien = @varID";
      return pool.request()
      .input("varID",db.sql.Int, id)
      .query(sqlstring, (e, data) => {
        if (data.recordset.length>0) result(null, data.recordset[0]);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  },

};
