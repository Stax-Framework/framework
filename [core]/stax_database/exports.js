const DeleteMany = require("./actions/deleteMany.js");
const DeleteOne = require("./actions/deleteOne.js");
const Find = require("./actions/find.js");
const FindOne = require("./actions/findOne.js");
const InsertMany = require("./actions/insertMany.js");
const InsertOne = require("./actions/insertOne.js");
const ReplaceOne = require("./actions/replaceOne.js");
const UpdateMany = require("./actions/updateMany.js");
const UpdateOne = require("./actions/updateOne.js");

function RegisterExports() {
  global.exports("deleteMany", DeleteMany);
  global.exports("deleteOne", DeleteOne);
  global.exports("find", Find);
  global.exports("findOne", FindOne);
  global.exports("insertMany", InsertMany);
  global.exports("insertOne", InsertOne);
  global.exports("replaceOne", ReplaceOne);
  global.exports("updateMany", UpdateMany);
  global.exports("updateOne", UpdateOne);
}

module.exports = RegisterExports