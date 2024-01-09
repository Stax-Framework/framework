const { MongoClient, GridFSBucket } = require('mongodb');
const config = require('./config.js');

async function CreateConnection() {
  try {
    const connection = await MongoClient.connect(`mongodb://${config.host}:${config.port}/${config.db}`, {
      maxPoolSize: parseInt(config.pool.max),
      minPoolSize: parseInt(config.pool.min)
    });

    connection.on("commandSucceeded", (e) => {
      console.log("Mongo Connection Successful | " + e.connectionId);
    })

    return connection;
  } catch(err) {
    console.error(`[STAX Mongo] : [Error] : ${err}`);
    return;
  }
}

async function CreateFSBucket(name) {
  try {
    const connection = await CreateConnection();
    const db = connection.db(config.db);

    return new GridFSBucket(db, { bucketName: `${config.db}_${name}` });;
  } catch(err) {
    console.error(`[STAX Mongo FSBucket] : [Error] : ${err}`);
    return;
  }
}

module.exports = {
  connection: CreateConnection,
  bucket: CreateFSBucket
}