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
          if (data2.recordset.length > 0) result(null, data2.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },

  async change_received_onegetOrderByID(id, result) {
    try {
      const pool = await db.conn;
      const sqlstring = "select * from donhang where MaDonHang = @varid";
      return await pool
        .request()
        .input("varid", db.sql.Int, id)
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, data2.recordset[0]);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },

  async get_order_one(iddh,idtx, result) {
    try {
      const pool = await db.conn;
      const sqlstring = 
      "update donhang set mataixe = @varidtx, tinhtrang = N'Đang giao' where madonhang = @varidh ";
      return await pool
        .request()
        .input("varidtx", db.sql.Int, idtx)
        .input("varidh", db.sql.Int, iddh)
        .query(sqlstring, (e, data2) => {
          if (!e) result(null, "successful");
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },

  async getDriverOrder(id, result) {
    try {
      const pool = await db.conn;
      const sqlstring = "select * from donhang where MaTaiXe = @varid";
      return await pool
        .request()
        .input("varid", db.sql.Int, id)
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, data2.recordset);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },

  async getOrderByID(id, result) {
    try {
      const pool = await db.conn;
      const sqlstring = "select * from donhang where madonhang = @varid";
      return await pool
        .request()
        .input("varid", db.sql.Int, id)
        .query(sqlstring, (e, data2) => {
          if (data2.recordset.length > 0) result(null, data2.recordset[0]);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },

  async change_received_one(id,state, result) {
    try {
      const pool = await db.conn;
      const sqlstring = 
      "update donhang set tinhtrang = @varState where madonhang = @varID";
      return await pool
        .request()
        .input("varID", db.sql.Int, id)
        .input("varState", db.sql.NVarChar, state)
        .query(sqlstring, (e, data2) => {
          if (!e) result(null, null);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },

};
