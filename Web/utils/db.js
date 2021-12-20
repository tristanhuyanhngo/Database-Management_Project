import sql from "mssql/msnodesqlv8.js";

// Khoa: "DESKTOP-I5NJLCP\\WANDER",
// HA: "DESKTOP-3218CJS\\",
// PA: "MSI\\SQLEXPRESS"

 /* Server cua Huy Anh - Dung co xoa
 DESKTOP-SFNTJJK\\SQLEXPRESS
 *  server: "DESKTOP-3218CJS\\",
 user:"sa",
 password: "1",
 database:"HTDCHO",
 driver:"msnodesqlv8",
 */

/**
 * Server cua PA
 *MSI\SQLEXPRESS
 */

const config = {
    server: "",
    user:"sa",
    password: "1",
    database:"HTDCHO",
    driver:"msnodesqlv8",
}

const connect = new sql.ConnectionPool(config).connect().then(pool=>{
    return pool;
})

const database = {
    conn:connect,
    sql:sql
};

export default database
