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
        "select * from HopDong where HopDong.ThoiGianHieuLuc < getdate() and TinhTrang = N'Đã duyệt' ";
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
      console.log(date)
      if(date!=null&&date!=undefined)
      {
        const pool = await db.conn;
        const sqlstring =
          "update hopdong set ThoiGianHieuLuc = @varDate where MaHopDong = @varID";
        return pool
          .request()
          .input("varDate", db.sql.Date, date)
          .input("varID", db.sql.Int, id)
          .query(sqlstring, (e, data) => {
            if (!e) result(null, "thành công");
            else result(true, null);
          });
      }
      else result(true, null);
     
    } catch {
      result(true, null);
    }
  },

  async mail(id, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "select doitac.MaSoThue as id, doitac.TenDoitac as name  from hopdong,doitac where MaHopDong = @varID and doitac.masothue = hopdong.masothue";
      return pool
        .request()
        .input("varID", db.sql.Int, id)
        .query(sqlstring, (e, data) => {
          if (!e) result(null, data.recordset[0]);
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },

  async sendMail(id, msg, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "insert into ThongBao(MaSoThue,NoiDung) values(@varID, @varMSG)";
      return pool
        .request()
        .input("varID", db.sql.Int, id)
        .input("varMSG", db.sql.NVarChar, msg)
        .query(sqlstring, (e, data) => {
          if (!e) result(null, "Thành công");
          else result(true, null);
        });
    } catch {
      result(true, null);
    }
  },
};
