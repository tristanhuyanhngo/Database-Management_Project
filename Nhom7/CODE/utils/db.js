import sql from "mssql/msnodesqlv8.js";

// Khoa: "DESKTOP-I5NJLCP\\WANDER",
// HA: "DESKTOP-3218CJS\\", "ASUS-VIVOBOOK-T\\SQLEXPRESS"
// PA: "MSI\\SQLEXPRESS"

const config = {
    server: "ASUS-VIVOBOOK-T\\SQLEXPRESS",
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
