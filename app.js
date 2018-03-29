/**
* Module dependencies.
*/

var express = require('express')
  , http = require('http')
  , path = require('path');
var cors = require('cors');
var app = express();
var bodyParser=require("body-parser");
var mysql    = require('mysql');
require('dotenv').config();

/**
* creating mysql connection class
*/
function Conn () {
    var self = this;
    db_config = {
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
        database : process.env.DB_NAME
    };
    var connection;
    self.handleDisconnect();
}

Conn.prototype.handleDisconnect = function() {
    var self = this;
    connection = mysql.createConnection(db_config); // Recreate the connection, since
                                                       // the old one cannot be reused.
    console.log('create new connection');
    self.openConn();

};

Conn.prototype.openConn = function () {
    var self = this;
    connection.connect(function(err) {              // The server is either down
        if(err) {                                     // or restarting (takes a while sometimes).
            console.log('error when connecting to db:', err);
            var reConnect = new Conn();
            setTimeout(reConnect.handleDisconnect(), 2000); // We introduce a delay before attempting to reconnect,
        } else {
            console.log('connection success');
        }                                  // to avoid a hot loop, and to allow our node script to
        self.errorConn();
    });                                     // process asynchronous requests in the meantime.
                                            // If you're also serving http, display a 503 error.
};

Conn.prototype.errorConn = function () {
    var self = this;
    connection.on('error', function(err) {
        console.log('db error', err);
        if(err.code === 'PROTOCOL_CONNECTION_LOST') { // Connection to the MySQL server is usually
            self.handleDisconnect();                  // lost due to either server restart, or a
        } else {                                      // connnection idle timeout (the wait_timeout
            throw err;                                  // server variable configures this)
        }
    });

    self.setEnv ();
};

/**
* all environments.
*/
Conn.prototype.setEnv = function () {
    app.set('port', process.env.PORT || 3000);
    app.use(bodyParser.urlencoded({ extended: false }));
    app.use(bodyParser.json());

    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
    });

    /**
     * creating server.
     */
    http.createServer(app).listen(app.get('port'), function(){
        console.log('Express server listening on port ' + app.get('port'));
    });
};

new Conn();

/**
* routes.
*/

var routes = require('./routes/userRoutes'); //to get something which located in the same forlder with the caller file folder
routes(app);