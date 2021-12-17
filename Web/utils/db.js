import fn from 'knex';

const knex = fn({
    client: 'mysql2',
    connection: {
        host: '127.0.0.1',
        port: 3306,
        user: 'root',
        password: '1234',
        database: 'ecdb'
    },
    pool: { min: 0, max: 10 }
});

export default knex;

// const config = {
//     server: "DESKTOP-I5NJLCP\WANDER",
//     user:"sa",
//     password: "1",
//     database:"HTDCHO",
//     driver:"msnodesqlv8",
// }
// //"ADB1_6_DATH2"
// const connect = new sql.ConnectionPool(config).connect().then(pool=>{
//     return pool;
// })
//
// exports default =
// {
//     conn:connect,
//     sql:sql
// }