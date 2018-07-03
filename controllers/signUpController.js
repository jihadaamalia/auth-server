/**
 * Module dependencies.
 */
require('dotenv').config();
var jwt = require('jsonwebtoken');
var atob = require('atob');
var Cryptr = require('cryptr');
cryptr = new Cryptr(process.env.CRYPTER_KEY);
var signIn = require('./signInController');


/**
 * SIGNUP SERVICES
 */
exports.signUp=function(req , res){
    self = this;
    var userData = req.body;

    var bin_pass = atob(userData.password);
    var encrypted_pass = cryptr.encrypt(bin_pass);

    var checkEmail = "SELECT * FROM `user` WHERE `email`= '"+userData.email+"'";
    db.query(checkEmail, function(err, result){
        if(err) {
            res.json({
                status: 500,
                error: true,
                error_msg: {
                    title: 'MySQL went wrong',
                    detail: err
                },
                response: ''
            });
            res.end();
        } else if (result[0]){
            res.json({
                status: 403,
                error: true,
                error_msg: {
                    title: 'Email already registered!',
                    detail: ''
                },
                response: ''
            });
            res.end();
        } else {
            self.createUser ();
        }
    });

    self.createUser = function () {
        var createUser = "INSERT INTO `user`(`username`,`password`,`email`,`first_login`,`added_at`) VALUES ('" + userData.username + "', '" + encrypted_pass + "', '" + userData.email + "', 1, CURRENT_TIMESTAMP())";

        db.query(createUser, function(err, result){
            if(err) {
                res.json({
                    status: 500,
                    error: true,
                    error_msg: {
                        title: 'MySQL went wrong',
                        detail: err
                    },
                    response: ''
                });
                res.end();
            } else {
                self.createUserProf();
            }
        });
    };

    self.createUserProf = function () {
        var createUserProf = "INSERT INTO user_profile (username_id) SELECT user.id FROM user WHERE user.username = '" + userData.username + "'";

        db.query(createUserProf, function(err, resultProfile) {
            if (err) {
                res.json({
                    status: 500,
                    error: true,
                    error_msg: {
                        title: 'MySQL went wrong',
                        detail: err
                    },
                    response: ''
                });
                res.end();
            } else {
                self.createPet();
            }
        });
    };

    self.createPet = function () {
        var createPet = "INSERT INTO pet (user_id) SELECT user_profile.id FROM user_profile JOIN user ON user_profile.username_id = user.id WHERE user.username = '" + userData.username + "'";

        db.query(createPet, function(err, resultProfile) {
            if (err) {
                res.json({
                    status: 500,
                    error: true,
                    error_msg: {
                        title: 'MySQL went wrong',
                        detail: err
                    },
                    response: ''
                });
                res.end();
            } else {
                res.json({
                    status: 200,
                    error: false,
                    error_msg: {
                        title: '',
                        detail: ''
                    },
                    response: 'User added!'
                });
                res.end();
            }
        });
    }
};


exports.check_username=function(req, res){
    var username =req.body.username;
    var check_username = "SELECT * FROM `user` WHERE `username`= '"+username+"'";
    var query = db.query(check_username, function(err, result){
        if(result.length == 0){
            res.json({
                status: 200,
                error: false,
                error_msg: {
                    title: '',
                    detail: ''
                },
                response: {
                    availability: true //username available
                }
            });
            res.end();
        }
        else{
            res.json({
                status: 200,
                error: false,
                error_msg: {
                    title: '',
                    detail: ''
                },
                response: {
                    availability: false //username already used
                }
            });
            res.end();
        }
    });
};