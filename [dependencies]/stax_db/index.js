const SendQuery = require("./database");

exports("SendQuery", (query, data, callback) => {
  query = query.replace(/\r?\n|\r/g, "");
  
  SendQuery(query, data, (results) => {
    callback(results)
  });
})