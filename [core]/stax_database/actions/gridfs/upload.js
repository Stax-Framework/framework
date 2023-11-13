const fs = require("fs");
const { bucket } = require("../../connection.js");
const config = require("../../config.js");

async function Upload(fsBucket, name) {
  const b = await bucket(fsBucket);
  const stream = b.openUploadStream(name, {
    chunkSizeBytes: 1048576,
  })
}

module.exports = Upload;