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
    self = this;
    var username = req.body.username;
    var pass = req.body.password;
    var bin_pass = atob(pass);
    var encrypted_pass = cryptr.encrypt(bin_pass);
    var sql="SELECT * FROM `user` WHERE `username`='"+username+"' and password = '"+encrypted_pass+"'";


    db.query(sql, function(err, results){ //get user tables data
        if (err || results.length < 1) {
            res.json({
                status: 404,
                error: true,
                error_msg: {
                    title: 'Wrong user or password',
                    detail: results
                },
                response: ''
            });
            res.end();
        }
        else if(results.length > 0){
            self.token_data = {
                username : results[0].username
            };

            if (results[0].first_login == 1) {
                var first_login = true;
                self.createToken(first_login);
            } else {
                var getUserProf="SELECT id FROM `user_profile` WHERE `username`='"+username+"'";
                db.query(getUserProf, function(err, profResults){
                    self.token_data.user_id = profResults[0].id;

                    var getPet="SELECT id FROM `pet` WHERE `user_id`='"+profResults[0].id+"'";
                    db.query(getPet, function(err, petResults){
                        self.token_data.pet_id = petResults[0].id;
                        self.createToken();
                    })
                });
            }
        }
    });


    self.createToken = function (first_login){
        var data = JSON.stringify(self.token_data);
        var secret = process.env.JWT_SECRET_KEY;
        // var now = Math.floor(Date.now() / 1000), //for creating an expire tim
        //     expiresIn = 3600, //1 hour
        //     expBefore = (now + expiresIn)
        var jwtId = Math.random().toString(36).substring(7);

        var payload = {
            jwtid : jwtId,
            data: data
        };

        var header = {
            algorithm: 'HS256',
            audience : 'TEST'
        };

        jwt.sign(payload, secret, header, function(err, token) {
            if(err){
                res.json({
                    status: 500,
                    error: true,
                    error_msg: {
                        title: 'Error occurred while generating token',
                        detail: err
                    },
                    response: '',
                });
                res.end();
            } else {
                if(token){
                    if (first_login) { //custom response depends on first login state
                        self.success_res = {
                            token: token,
                            first_login: first_login
                        }
                    } else {
                        self.success_res = {
                            token: token
                        }
                    }

                    res.header();
                    res.json({
                        status: 200,
                        error: false,
                        error_msg: '',
                        response: self.success_res
                    });
                    res.end();
                } else{
                    res.json({
                        status: 500,
                        error: true,
                        error_msg: {
                            title: 'Could not generate token'
                        },
                        response: ''
                    });
                    res.end();
                }
            }
        });
    };

};
