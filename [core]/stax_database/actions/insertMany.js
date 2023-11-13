const { connection } = require("../connection.js");
const config = require("../config.js");

async function InsertMany(name, documents, options = {}, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(config.db);
    const collection = db.collection(name);
    const results = await collection.insertMany(documents, options);

    return callback(true, results.insertedIds);
  } catch(err) {
    console.error(`[STAX Mongo] : (InsertMany)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

module.exports = InsertMany;