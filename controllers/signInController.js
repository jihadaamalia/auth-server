/**
 * Module dependencies.
 */
require('dotenv').config();
var jwt = require('jsonwebtoken');
var atob = require('atob');
var Cryptr = require('cryptr');
cryptr = new Cryptr(process.env.CRYPTER_KEY);

//---------------------------------------login services----------------------------------------------------------
exports.user = function(req, res){
    var username = req.body.username;
    var pass = req.body.password;
    var bin_pass = atob(pass);
    var encrypted_pass = cryptr.encrypt(bin_pass);
    var sql="SELECT * FROM `user` WHERE `username`='"+username+"' and password = '"+encrypted_pass+"'";

    db.query(sql, function(err, results){
        if(results){
            var data = JSON.stringify(results[0]);
            var secret = process.env.JWT_SECRET_KEY;
            var now = Math.floor(Date.now() / 1000),
                expiresIn = 3600, //1 hour
                expBefore = (now + expiresIn),
                jwtId = Math.random().toString(36).substring(7);

            var payload = {
                jwtid : jwtId,
                data: data,
                exp: expBefore
            };

            var header = {
                algorithm: 'HS256',
                audience : 'TEST'
            };

            jwt.sign(payload, secret, header, function(err, token) {
                if(err){
                    res.json({
                        "results":
                            {
                                "status": false,
                                "msg" : 'Error occurred while generating token'
                            }
                    });
                } else {
                    if(token != false){
                        res.header();
                        res.json({
                            "results":
                                {"status": true,
                                    "token" : token
                                }
                        });
                        res.end();
                    }
                    else{
                        res.json({
                            "results":
                                {"status": false,"msg" : 'Could not create token'},
                        });
                        res.end();
                    }

                }
            });
        }
        else if(!results){
            res.json({
                "results": err
            });
            res.end();
        }
    });
};