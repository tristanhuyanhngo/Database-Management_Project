import db from "../utils/db.js";

export default {
//   async findAll(result) {
//     try {
//       const pool = await db.conn;
//       const sqlstring = "select * from khachhang";
//       return await pool.request().query(sqlstring, (e, data2) => {
//         if (data2.recordset.length > 0) result(null, data2.recordset);
//         else result(true, null);
//       });
//     } catch {
//       result(true, null);
//     }
//   },

  async checkLogin(log,result) {
    try {
      const pool = await db.conn;
      const sqlstring =
       "select nguoidung as id from taikhoan where TenDangNhap = @varDN and MatKhau = @varMK";
      return await pool.request()
      .input("varDN",db.sql.VarChar, log.username)
      .input("varMK",db.sql.VarChar, log.pass)
      .query(sqlstring, (e, data2) => {
        if (!e) result(null, data2.recordset[0]);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  },
};
