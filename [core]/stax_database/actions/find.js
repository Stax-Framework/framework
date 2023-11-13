const { connection } = require("../connection.js");
const config = require("../config.js");

async function Find(name, query = {}, options = {}, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(config.db);
    const collection = db.collection(name);
    const cursor = collection.find(query, options);

    if (await collection.countDocuments(query) === 0) {
      return callback(false, "No documents found!");
    }

    const documents = await cursor.toArray()

    return callback(true, documents);
  } catch(err) {
    console.error(`[STAX Mongo] : (Find)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

module.exports = Find;