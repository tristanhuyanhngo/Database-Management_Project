import db from "../../utils/db.js";

export default {
  async pendingContract(result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "select * from HopDong where HopDong.TinhTrang = N'Chờ duyệt'";
      return pool.request().query(sqlstring, (e, data) => {
        for (let i = 0; i < data.recordset.length; i++) {
          if (data.recordset[i].ThoiGianHieuLuc != null) {
            let dd = data.recordset[i].ThoiGianHieuLuc.getDate();
            let mm = data.recordset[i].ThoiGianHieuLuc.getMonth() + 1;
            let yyyy = data.recordset[i].ThoiGianHieuLuc.getFullYear();
            data.recordset[i].ThoiGianHieuLuc = dd + "-" + mm + "-" + yyyy;
          }
        }

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
        for (let i = 0; i < data.recordset.length; i++) {
          if (data.recordset[i].ThoiGianHieuLuc != null) {
            let dd = data.recordset[i].ThoiGianHieuLuc.getDate();
            let mm = data.recordset[i].ThoiGianHieuLuc.getMonth() + 1;
            let yyyy = data.recordset[i].ThoiGianHieuLuc.getFullYear();
            data.recordset[i].ThoiGianHieuLuc = dd + "-" + mm + "-" + yyyy;
          }
        }
        if (data.recordset.length > 0) result(null, data.recordset);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  },

  async updateState(id, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "update hopdong set TinhTrang = N'Đã duyệt' where MaHopDong = @varID";
      return pool
        .request()
        .input("varID", db.sql.Int, id)
        .query(sqlstring, (e, data) => {
          if (!e) result(null, "thành công");
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },

  async updateDate(id, date, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "update hopdong set ThoiGianHieuLuc = @varDate where MaHopDong = @varID";
      return pool
        .request()
        .input('varDate',db.sql.Date,date)
        .input('varID',db.sql.Int,id)
        .query(sqlstring, (e, data) => {
          if (!e) result(null, "thành công");
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },
};
