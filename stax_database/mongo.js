const { connection } = require("./connection.js");
const { db: database } = require("./config.js");

async function DeleteMany(name, query, options, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    config
    const db = client.db(database);
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

async function DeleteOne(name, query, options, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(database);
    const collection = db.collection(name);
    const results = await collection.deleteOne(query, options);

    return callback(true, results.deletedCount);
  } catch(err) {
    console.error(`[STAX Mongo] : (DeleteOne)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

async function Find(name, query = {}, options = {}, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(database);
    const collection = db.collection(name);
    const cursor = collection.find(query, options);

    const documents = await cursor.toArray()

    return callback(true, documents);
  } catch(err) {
    console.error(`[STAX Mongo] : (Find)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

async function FindOne(name, query = {}, options = {}, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(database);
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

async function InsertMany(name, documents, options = {}, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(database);
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

async function InsertOne(name, document, options = {}, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(database);
    const collection = db.collection(name);
    const result = await collection.insertOne(document, options);

    return callback(true, result.insertedId);
  } catch(err) {
    console.error(`[STAX Mongo] : (InsertOne)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

async function ReplaceOne(name, query, replacement, options, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(database);
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

async function UpdateMany(name, query, documents, options, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(database);
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

async function UpdateOne(name, query, document, options, callback) {
  const client = await connection();

  if (!client) {
    return callback(false, "Mongo Client Undefined");
  }

  try {
    const db = client.db(config.db);
    const collection = db.collection(name);
    const results = await collection.updateOne(query, document, options);

    return callback(true, results.modifiedCount);
  } catch(err) {
    console.error(`[STAX Mongo] : (UpdateOne)[Error] : ${err}`);
    return callback(false, err);
  } finally {
    client.close();
  }
}

module.exports = {
  DeleteMany,
  DeleteOne,
  Find,
  FindOne,
  InsertMany,
  InsertOne,
  ReplaceOne,
  UpdateMany,
  UpdateOne
}