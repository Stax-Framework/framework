const { connection } = require("../connection.js");
const config = require("../config.js");

async function DeleteMany(name, query, options, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(config.db);
    const collection = db.collection(name);
    const results = await collection.deleteMany(query, options);

    return callback(true, results.deletedCount);
  } catch(err) {
    console.error(`[STAX Mongo] : (DeleteMany)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

module.exports = DeleteMany;