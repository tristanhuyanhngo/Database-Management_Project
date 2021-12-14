const { conn, sql } = require("../../connectdb");
const {random} = require("../function/function")
module.exports = function () {
  this.dathang = async (thongtindh,chitietdh,result) => {
    try {
      const tendh = await random(40)
      const phivanchuyen = Math.floor(Math.random() * 100000) + 10000
      const pool = await conn;

      const sqlstring = 
      "insert into donhang(TenDonHang,NgayDat,TinhTrang,KhuVuc, PhiVanChuyen, PhiSanPham, HinhThucThanhToan,DiaChiGiaoHang, MaKhachHang,Masothue,Mataixe) " 
      + "values(@varTDH, getdate(), N'Chờ', @varKV, @varPVC, 0, @varHTTT, @varDCGH, @varKH, @varDT, null)"
      await pool.request()
      .input('varTDH', sql.NVarChar, tendh)
      .input('varKV', sql.NVarChar, thongtindh.khuvuc)
      .input('varPVC', sql.Int, phivanchuyen)
      .input('varHTTT', sql.NVarChar, thongtindh.httt)
      .input('varDCGH', sql.NVarChar, thongtindh.dcgh)
      .input('varKH', sql.Int, thongtindh.makh)
      .input('varDT', sql.Int, thongtindh.madt)
      .query(sqlstring)

      const sqlstring2 = "select MAX(madonhang) as mdh from donhang"
      const madh = await pool.request().query(sqlstring2)
      for (let i = 0; i < chitietdh.length; i++) {
        const sqlstring3 =
          "insert into DHSP(MaDonHang,MaSP,SoLuong,Gia) values(@varDH, @varSP, @varSL,0)";
        await pool
          .request()
          .input("varDH", sql.Int, madh.recordset[0].mdh)
          .input("varSP", sql.Int, chitietdh[i].masanpham)
          .input("varSL", sql.Int, chitietdh[i].soluong)
          .query(sqlstring3);
      }

      result(null, "đặt thành công");
    } catch {
      result(true, null);
    }
  };

  this.xemdanhsachsanphamcuadoitac = async(id,result)=>{
    try {
      const pool = await conn;
      const sqlstring = "SELECT sanpham.* FROM sanpham, doitac, chinhanh "+ 
                        "where sanpham.machinhanh = chinhanh.machinhanh and chinhanh.masothue = doitac.masothue " + 
                        "and doitac.masothue = @varID"
      return await pool.request()
      .input('varID',sql.Int, id)
      .query(sqlstring, (e, data) => {
        if (!e) result(null, data.recordset);
        else result(true, null);
      });
    } catch {
      result(true, null);
    }
  };
}