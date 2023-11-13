const { connection } = require("../connection.js");
const { config } = require("../config.js");

async function UpdateMany(name, query, documents, options, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(config.db);
    const collection = db.collection(name);
    const results = await collection.updateMany(query, documents, options)

    return callback(true, results.modifiedCount);
  } catch(err) {
    console.error(`[STAX Mongo] : (UpdateMany)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

module.exports = UpdateMany;