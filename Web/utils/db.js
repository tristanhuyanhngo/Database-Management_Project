// import fn from 'knex';

// const knex = fn({
//     client: 'mysql2',
//     connection: {
//         host: '127.0.0.1',
//         port: 3306,
//         user: 'root',
//         password: '1234',
//         database: 'ecdb'
//     },
//     pool: { min: 0, max: 10 }
// });

// export default knex;

import sql from "mssql/msnodesqlv8.js"
const config = {
    server: "DESKTOP-I5NJLCP\\WANDER",
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