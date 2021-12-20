import db from "../../utils/db.js";

export default {
  async checkLogin(log,result) {
    try {
      const pool = await db.conn;
      const sqlstring =
       "select nguoidung as id, loainguoidung as type from taikhoan where TenDangNhap = @varDN and MatKhau = @varMK";
      return await pool.request()
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

  async getInforDrive(id,result) {
    try {
      const pool = await db.conn;
      const sqlstring =
       "select * from taixe where mataixe = @varID";
      return await pool.request()
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
