import db from "../../utils/db.js";

export default {
  async driverRegister(data, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "insert into taixe(HoTen,CMND,DienThoai,BienSoXe,DiaChi,KhuVucHoatDong,Email,STK,NganHang) " +
        "values(@varName, @varCMND, @varSDT, @varBSX, @varAdress, @varArea, @varEmail, @varSTK, @varNH)";
      await pool
        .request()
        .input("varName", db.sql.VarChar, data.fullname)
        .input("varCMND", db.sql.VarChar, data.identity)
        .input("varSDT", db.sql.VarChar, data.phone)
        .input("varBSX", db.sql.VarChar, data.plate)
        .input("varAdress", db.sql.VarChar, data.address)
        .input("varArea", db.sql.VarChar, data.area)
        .input("varEmail", db.sql.VarChar, data.email)
        .input("varSTK", db.sql.VarChar, data.bankaccount)
        .input("varNH", db.sql.VarChar, data.bank)
        .query(sqlstring);

      const sqlstring2 = "select max(mataixe) as id from taixe";
      const user = await pool.request().query(sqlstring2);

      const sqlstring3 =
        "insert into taikhoan(TenDangNhap,MatKhau,LoaiNguoiDung,TinhTrang,nguoidung) " +
        "values(@varUsername,@varPass,4,N'Mở',@varID)";
      await pool
        .request()
        .input("varUsername", db.sql.VarChar, data.username)
        .input("varPass", db.sql.VarChar, data.pass)
        .input("varID", db.sql.Int, user.recordset[0].id)
        .query(sqlstring3);

      result(null, "đăng ký thành công");
    } catch {
      result(true, null);
    }
  },

  async customerRegister(data, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "insert into KhachHang(HoTen,SDT,DiaChi,Email) " +
        "values(@varName, @varSDT, @varAdress, @varEmail)";
      await pool
        .request()
        .input("varName", db.sql.NVarChar, data.fullname)
        .input("varSDT", db.sql.VarChar, data.phone)
        .input("varAdress", db.sql.NVarChar, data.address)
        .input("varEmail", db.sql.VarChar, data.email)
        .query(sqlstring);

      const sqlstring2 = "select max(makhachhang) as id from khachhang";
      const user = await pool.request().query(sqlstring2);

      const sqlstring3 =
        "insert into taikhoan(TenDangNhap,MatKhau,LoaiNguoiDung,TinhTrang,nguoidung) " +
        "values(@varUsername,@varPass,3,N'Mở',@varID)";
      await pool
        .request()
        .input("varUsername", db.sql.VarChar, data.username)
        .input("varPass", db.sql.VarChar, data.pass)
        .input("varID", db.sql.Int, user.recordset[0].id)
        .query(sqlstring3);

      result(null, "đăng ký thành công");
    } catch {
      result(true, null);
    }
  },

  async partnerRegister(data, result) {
    try {
      const pool = await db.conn;
      const sqlstring =
        "insert into doitac(TenDoitac,NguoiDaiDien,ThanhPho,Quan,SoChiNhanh,"+
        "SoLuongDonHangMoiNgay,LoaiHangVanChuyen,DiaChiKinhDoanh,SDT,Email) " +
        "values(@varTDT, @varNDD, @varTP, @varQ, @varSCN, @varSLDHMN, @varLHVC, @varDCKD, @varSDT, @varEmail)";
      await pool
        .request()
        .input("varTDT", db.sql.NVarChar, data.Pfullname)
        .input("varNDD", db.sql.NVarChar, data.Dfullname)
        .input("varTP", db.sql.NVarChar, data.area)
        .input("varQ", db.sql.NVarChar, data.district)
        .input("varSCN", db.sql.Int, data.branches)
        .input("varSLDHMN", db.sql.Int, data.orders)
        .input("varLHVC", db.sql.NVarChar, data.goods)
        .input("varDCKD", db.sql.NVarChar, data.address)
        .input("varSDT", db.sql.VarChar, data.phone)
        .input("varEmail", db.sql.VarChar, data.email)
        .query(sqlstring);

      const sqlstring2 = "select max(masothue) as id from doitac";
      const user = await pool.request().query(sqlstring2);

      const sqlstring3 =
        "insert into taikhoan(TenDangNhap,MatKhau,LoaiNguoiDung,TinhTrang,nguoidung) " +
        "values(@varUsername,@varPass,2,N'Mở',@varID)";
      await pool
        .request()
        .input("varUsername", db.sql.VarChar, data.username)
        .input("varPass", db.sql.VarChar, data.pass)
        .input("varID", db.sql.Int, user.recordset[0].id)
        .query(sqlstring3);

      result(null, "đăng ký thành công");
    } catch {
      result(true, null);
    }
  },
};
