const { conn, sql } = require("../../connectdb");

module.exports = function () {
  this.kiemtrahopdong = async (result) => {
    try {
      const pool = await conn;
      const sqlstring = "SELECT * FROM Hopdong";
      return await pool.request().query(sqlstring, (e, data) => {
        if (!e) result(null, data.recordset);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  };

  this.vietthongbao = async (noidung, masothue, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "insert into thongbao(noidung,masothue) values(@varND, @varID)";
      return await pool
        .request()
        .input("varID", sql.Int, masothue)
        .input("VarND", sql.NVarChar, noidung)
        .query(sqlstring, (e, data) => {
          if (!e) result(null, "Đã thông báo tới đỐi tác");
          else result(true, "Thông báo thất bại tới đối tác");
        });
    } catch {
      result(true, "Thông báo thất bại tới đối tác");
    }
  };
};
