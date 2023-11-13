const { connection } = require("../connection.js");
const config = require("../config.js");

async function InsertOne(name, document, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(config.db);
    const collection = db.collection(name);
    const result = await collection.insertOne(document);

    return callback(true, result.insertedId);
  } catch(err) {
    console.error(`[STAX Mongo] : (InsertOne)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

module.exports = InsertOne;