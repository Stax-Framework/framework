const { connection } = require("../connection.js");
const config = require("../config.js");

async function FindOne(name, query = {}, options = {}, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(config.db);
    const collection = db.collection(name);
    const document = await collection.findOne(query, options);

    return callback(true, document);
  } catch(err) {
    console.error(`[STAX Mongo] : (FindOne)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

module.exports = FindOne;