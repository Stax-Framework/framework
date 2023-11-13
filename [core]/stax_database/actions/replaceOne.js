const { connection } = require("../connection.js");
const config = require("../config.js");

async function ReplaceOne(name, query, replacement, options, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(config.db);
    const collection = db.collection(name);
    const results = await collection.replaceOne(query, replacement, options);

    return callback(true, results.modifiedCount);
  } catch(err) {
    console.error(`[STAX Mongo] : (ReplaceOne)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

module.exports = ReplaceOne;