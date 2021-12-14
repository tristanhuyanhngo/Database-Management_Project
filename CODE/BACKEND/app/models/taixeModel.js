const { conn, sql } = require("../../connectdb");
module.exports = function () {

    this.xemdanhsachdonhang = async (kv,result) => {
        try {
          const pool = await conn;
          const sqlstring = "SELECT * FROM donhang where khuvuc = @varKV and TinhTrang = N'Chờ'";
          return await pool.request()
          .input('varKV',sql.NVarChar,kv)
          .query(sqlstring, (e, data) => {
            if (!e) result(null, data.recordset);
            else result(true, null);
          });
        } catch {
          result(true, null);
        }
      };
}