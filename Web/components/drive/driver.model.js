import db from "../../utils/db.js";

export default {
  async getOrder(area, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "select * from donhang where KhuVuc = @varArea and TinhTrang = N'Chờ'";
      return await pool
        .request()
        .input("varArea", db.sql.NVarChar, area)
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length>0) result(null, data2.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },

  async getOrderByID(id, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
          "select * from donhang where MaDonHang = @varid";
      return await pool
          .request()
          .input("varid", db.sql.Int, id)
          .query(sqlstring, (e, data2) => {
            if (data2.recordset.length>0) result(null, data2.recordset[0]);
            else result(true, null);
          });
    } catch {
      result(true, null);
    }
  },
    async getDriverOrder(id, result) {
        try {
            const pool = await db.conn;
            const sqlstring =
                "select * from donhang where MaTaiXe = @varid";
            return await pool
                .request()
                .input("varid", db.sql.Int, id)
                .query(sqlstring, (e, data2) => {
                    if (data2.recordset.length>0) result(null, data2.recordset);
                    else result(true, null);
                });
        } catch {
            result(true, null);
        }
    }
};
