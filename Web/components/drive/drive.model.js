import db from "../../utils/db.js";

export default {
  async getOrder(area, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "select * from donhang where KhuVuc = @varArea";
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
  }
};
