import db from '../utils/db.js';

export default {
  async findAll(result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "select * from khachhang";
      return await pool.request()
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, data2.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },
}
