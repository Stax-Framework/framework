const mysql = require("mysql");

const config = require("./config");

// Database Pool
const pool = mysql.createPool({
  connectionLimit: config.connectionLimit,
  host: config.host,
  user: config.user,
  password: config.password,
  database: config.database
});

function SendQuery(query, data, callback) {
  pool.getConnection((connectionError, connection) => {

    // Connection Error
    if (connectionError) {
      callback({ ok: false, results: [], meta: {}, error: connectionError });
      return;
    }

    connection.query(query, data, (queryError, data, fields) => {
      
      // Query Error
      if (queryError) {
        callback({ ok: false, results: [], meta: {}, error: queryError });
        return;
      }

      if (query.includes("SELECT")) {
        SelectQuery(data, callback, connection);
        return;
      }

      if (query.includes("DELETE")) {
        DeleteQuery(data, callback, connection);
        return;
      }

      if (query.includes("UPDATE")) {
        UpdateQuery(data, callback, connection);
        return;
      }

      if (query.includes("INSERT")) {
        InsertQuery(data, callback, connection);
        return;
      }

      callback({ ok: true, results: [], meta: {} });
      connection.release();
    })
  });
}

function SelectQuery(data, callback, connection) {
  callback({ ok: true, results: data, meta: {} })
  connection.release();
}

function DeleteQuery(data, callback, connection) {
  callback({ ok: true, results: [], meta: { affectedRows: data.affectedRows, insertId: data.insertId, changedRows: data.changedRows } })
  connection.release();
}

function UpdateQuery(data, callback, connection) {
  callback({ ok: true, results: [], meta: { affectedRows: data.affectedRows, insertId: data.insertId, changedRows: data.changedRows } })
  connection.release();
}

function InsertQuery(data, callback, connection) {
  callback({ ok: true, results: [], meta: { affectedRows: data.affectedRows, insertId: data.insertId, changedRows: data.changedRows } })
  connection.release();
}

// MySQL Pool Events
pool.on("connection", (connection) => {
  connection.config.queryFormat = (query, values) => {
    if (!values) return query;

    return query.replace(/\:(\w+)/g, (txt, key) => {
      if (values.hasOwnProperty(key)) {
        return this.escape(values[key]);
      }

      return txt
    }).bind(this);
  }


});

pool.on("connection", (connection) => {
	connection.config.queryFormat = function (query, values) {
      if (!values) return query;
      return query.replace(/\:(\w+)/g, function (txt, key) {
          if (values.hasOwnProperty(key)) {
              return this.escape(values[key]);
          }
          return txt;
      }.bind(this));
  };
  
  if (config.dev == "false") return;

  console.log(`Connection: ${connection.threadId}`);
});

pool.on("acquire", (connection) => {
  if (config.dev == "false") return;

  console.log(`Connection Acquired: ${connection.threadId}`);
  DisplayConnections();
});

pool.on("enqueue", () => {
  if (config.dev == "false") return;

  console.log("Waiting for available connection...");
});

pool.on("release", (connection) => {
  if (config.dev == "false") return;

  console.log(`Connection Released: ${connection.threadId}`);
  DisplayConnections();
});

// Event Function
function DisplayConnections() {
	console.log(`Acquiring Connections: ${pool._acquiringConnections.length}`);
	console.log("------------------------------------------------")
	console.log(`All Connections: ${pool._allConnections.length}`);
	console.log("------------------------------------------------")
	console.log(`Free Connections: ${pool._freeConnections.length}`);
	console.log("------------------------------------------------")
	console.log(`Connections Queued: ${pool._connectionQueue.length}`);
	console.log("------------------------------------------------")
}

module.exports = SendQuery;