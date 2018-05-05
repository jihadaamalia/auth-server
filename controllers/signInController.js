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
                    detail: err
                },
                response: ''
            });
            res.end();
        }
        else if(results.length > 0){
            var getUserProf="SELECT user.id AS username_id, user_profile.id AS user_id, pet.id AS pet_id FROM user JOIN user_profile ON user.id = user_profile.username_id JOIN pet ON user_profile.id = pet.user_id WHERE user.username='"+username+"'";
            db.query(getUserProf, function(err, tokenResults){

                self.token_data = {
                    username_id : tokenResults[0].username_id,
                    user_id : tokenResults[0].user_id,
                    pet_id : tokenResults[0].pet_id
                };

                if (results[0].first_login == 1) {
                    self.createToken(true);
                } else {
                    self.createToken(false);
                }
            });
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
                    self.success_res = {
                        token: token,
                        first_login: first_login
                    };

                    res.header();
                    res.json({
                        status: 200,
                        error: false,
                        error_msg: {
                            title: '',
                            detail: ''
                        },
                        response: self.success_res
                    });
                    res.end();
                } else{
                    res.json({
                        status: 500,
                        error: true,
                        error_msg: {
                            title: 'Could not generate token',
                            detail: ''
                        },
                        response: ''
                    });
                    res.end();
                }
            }
        });
    };

};
