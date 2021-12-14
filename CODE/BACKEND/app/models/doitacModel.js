const { conn, sql } = require("../../connectdb");

module.exports = function () {
  this.laphopdong = async (ID, sochinhanh, result) => {
    try {
      const pool = await conn;
      const sqlstring =
        "insert into HopDong(MaSoThue,SoChiNhanhDangKy,PhanTramHoaHong,ThoiGianHieuLuc,TinhTrang) " +
        "values(@varID, @varSCN , 10 , null, N'Chờ duyệt')";
      return await pool.request()
      .input('varID', sql.Int, ID)
      .input('varSCN', sql.Int, sochinhanh)
      .query(sqlstring, (e, data) => {
        if (!e) result(null, "lập hợp đồng thành công");
        else result(true, "lập hợp đồng thất bại");
      });
    } catch {
      result(true, "lập hợp đồng thất bại");
    }
  };

  this.danhsachsanpham = async (ID, result) => {
    try {
      const pool = await conn;
      const sqlstring = "select * from sanpham, chinhanh, doitac " +
                        "where sanpham.machinhanh = chinhanh.machinhanh " +
                        "and chinhanh.MaSoThue = @varID"
      return await pool.request()
      .input('varID', sql.Int, ID)
      .query(sqlstring, (e, data) => {
        if (!e) 
            result(null, data.recordset);
        else 
            result(true, null);
      });
    } catch {
      result(true, null);
    }
  };
};
