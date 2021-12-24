import db from "../../utils/db.js";

export default {
    async findCustomerByID(CusID) {
        const pool = await db.conn;
        const sqlstring = `select C.HoTen
                     from KhachHang as C
                     where C.MaKhachHang = ${CusID}`
        const list = await pool.request().input("varid", db.sql.Int, CusID).query(sqlstring);
        return list.recordset[0].HoTen;
    },
    async findOrdersByCustomerID(CusID) {
            const pool = await db.conn;
            const sqlstring = `select O.MaDonHang, O.NgayDat, O.TinhTrang, O.HinhThucThanhToan, O.PhiVanChuyen + O.PhiSanPham as TongTien 
                               from KhachHang as C
                               inner join DonHang as O on C.MaKhachHang = O.MaKhachHang
                               where C.MaKhachHang = ${CusID}
                               order by O.TinhTrang desc, O.NgayDat asc`;
            const list = await pool.request().input("varid", db.sql.Int, CusID).query(sqlstring);
            return list.recordset;
        } 
};