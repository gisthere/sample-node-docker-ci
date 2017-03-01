var config = require("./config");
var db = require("knex")(config);
var express = require("express");

express()
 .get("*", function(req, res) {
    res.send("<html><body><h1>It works!</h1><p>Continuous integration and deployment lab finished</p></body></html>");
 })
 .listen(80, function(err) {
    if (err) {
      console.error(err);
      return;
    }

    console.log("Express Server listening on port 80");
  })
;
