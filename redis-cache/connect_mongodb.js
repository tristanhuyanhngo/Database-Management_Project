import {MongoClient} from 'mongodb';

async function main(){
    const uri = "mongodb+srv://redis:anh12345@redis.gifwn.mongodb.net/test";
    const client = new MongoClient(uri);

    try {
        // Connect to the MongoDB cluster
        await client.connect();

        // Make the appropriate DB calls
        await  listDatabases(client);

    } catch (e) {
        console.error(e);
    } finally {
        await client.close();
    }
}
async function listDatabases(client){
    let databasesList;
    databasesList = await client.db().admin().listDatabases();

    console.log("Databases:");
    databasesList.databases.forEach(db => console.log(` - ${db.name}`));
};
main().catch(console.error);