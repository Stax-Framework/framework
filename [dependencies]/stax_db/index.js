const SendQuery = require("./database");

exports("SendQuery", (query, data, callback) => {
  if (query) {
    query = query.replace(/\r?\n|\r/g, "");

    SendQuery(query, data, (results) => {
      callback(results)
    });
  } else {
    console.log("No query passed to SendQuery export")
  }
})