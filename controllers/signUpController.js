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
exports.user=function(req , res){
    var userData = req.body;

    var bin_pass = atob(userData.password);
    var encrypted_pass = cryptr.encrypt(bin_pass);

    var checkEmail = "SELECT * FROM `user` WHERE `email`= '"+userData.email+"'";
    db.query(checkEmail, function(err, result){
        if(err) {
            res.json({
                status: 200,
                error: true,
                error_msg: err,
                response: ''
            });
        } else if (result[0]){
            res.json({
                status: 200,
                error: true,
                error_msg: 'Email already registered!',
                response: ''
            });
        } else {
            var userSql = "INSERT INTO `user`(`username`,`password`,`email`,`first_login`,`added_at`) VALUES ('" + userData.username + "', '" + encrypted_pass + "', '" + userData.email + "', 1, CURRENT_TIMESTAMP())";
            //var userProfileSql = "INSERT INTO `user_profile` (`name`, `user_dob`, `sex`, `username`, `photo`, `street`, `city`, `added_at`)  VALUES ('" + userData.name + "', '" + userData.user_dob + "', '" + userData.sex + "', '" + userData.username + "', '" + userData.photo + "', '" + userData.street + "', '" + userData.city + "', CURRENT_TIMESTAMP())";

            db.query(userSql, function(err, result){
                if(err) {
                    res.json({
                        status: 200,
                        error: true,
                        error_msg: err,
                        response: ''
                    });
                } else {
                    res.json({
                        status: 200,
                        error: false,
                        error_msg: '',
                        response: 'User added!'
                    });
                }
            });
        }
    });
};


exports.check_username=function(req, res){
    var username =req.body.username;
    var sql_username = "SELECT * FROM `user` WHERE `username`= '"+username+"'";
    var query = db.query(sql_username, function(err, result){
        if(result.length == 0){
            res.json({
                status: 200,
                error: false,
                error_msg: '',
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
                error_msg: '',
                response: {
                    availability: false //username already used
                }
            });
            res.end();
        }
    });
};