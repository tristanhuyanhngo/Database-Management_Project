import db from "../../utils/db.js";

export default {
  async checkLogin(log,result) {
    console.log(log)
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
};
