const MongoActions = require("./mongo.js");

function RegisterExports() {
  global.exports("deleteMany", MongoActions.DeleteMany);
  global.exports("deleteOne", MongoActions.DeleteOne);
  global.exports("find", MongoActions.Find);
  global.exports("findOne", MongoActions.FindOne);
  global.exports("insertMany", MongoActions.InsertMany);
  global.exports("insertOne", MongoActions.InsertOne);
  global.exports("replaceOne", MongoActions.ReplaceOne);
  global.exports("updateMany", MongoActions.UpdateMany);
  global.exports("updateOne", MongoActions.UpdateOne);
}

module.exports = RegisterExports