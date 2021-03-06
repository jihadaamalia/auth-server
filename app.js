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
 * creating mysql connection.
 */

var pool  = mysql.createPool({
    connectionLimit : 10,
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database : process.env.DB_NAME
});

console.log('create new connection');

pool.getConnection(function(err, connection) {
    if (err) {
        connection.release();
        console.log(' Error getting mysql_pool connection: ' + err);
        throw err;
    } else {
        console.log('connected!');
    }
});

global.db = pool;

/**
 * all environments.
 */
app.set('port', process.env.PORT || 3000);
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

/**
 * routes.
 */

var routes = require('./routes/userRoutes'); //to get something which located in the same forlder with the caller file folder
routes(app);

/**
 * creating server.
 */

http.createServer(app).listen(app.get('port'), function(){
    console.log('Express server listening on port ' + app.get('port'));
});
