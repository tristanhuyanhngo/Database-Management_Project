import db from "../../utils/db.js";

export default {
  async pendingContract(result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "select * from HopDong where HopDong.TinhTrang = N'Chờ duyệt'";
      return await pool.request().query(sqlstring, (e, data) => {
        if (data.recordset.length > 0) result(null, data.recordset);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  },

  async renewalContract(result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "select * from HopDong where HopDong.ThoiGianHieuLuc < getdate()";
      return await pool.request().query(sqlstring, (e, data) => {
        if (data.recordset.length > 0) result(null, data.recordset);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  },
};
