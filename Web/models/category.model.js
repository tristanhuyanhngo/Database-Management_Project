// const list = [
//   { CatID: 1, CatName: 'Laptop' },
//   { CatID: 2, CatName: 'Mobile' },
//   { CatID: 3, CatName: 'Quần áo' },
//   { CatID: 4, CatName: 'Giày dép' },
//   { CatID: 5, CatName: 'Trang sức' },
//   { CatID: 6, CatName: 'Khác' },
// ];

import db from '../utils/db.js';

export default {
  async findAll() {
    try {
      const pool = await db.conn;
      const sqlstring =
        "select * from khachhang";
      await pool.request()
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) return data2.recordset
          else return null
        });
    } catch {
      return null
    }
  },
}
