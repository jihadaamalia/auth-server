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

    var userSql = "INSERT INTO `user`(`username`,`password`,`email`,`added_at`) VALUES ('" + userData.username + "', '" + encrypted_pass + "', '" + userData.email + "', CURRENT_TIMESTAMP())";
    var userProfileSql = "INSERT INTO `user_profile` (`name`, `user_dob`, `sex`, `username`, `photo`, `street`, `city`, `added_at`)  VALUES ('" + userData.name + "', '" + userData.user_dob + "', '" + userData.sex + "', '" + userData.username + "', '" + userData.photo + "', '" + userData.street + "', '" + userData.city + "', CURRENT_TIMESTAMP())";

    const createUser = new Promise(function (resolve, reject) {
        db.query(userSql, function(err, result){
            if(err) reject(err);
            resolve(result)
        });
    });

    const createUserProf = new Promise(function (resolve, reject) {
        db.query(userProfileSql, function(err, result){
            if(err) reject(err);
            resolve(result);
        });
    });

    createUser
        .then(function (resA){ return createUserProf })
        .then(function (resB){
            var request = {
                "body" : {
                    "username" : userData.username,
                    "password" : userData.password
                }
            };
            signIn.user(request, res);
        })
        .catch(function (err){
            res.json({
                "status": "failed",
                "err": err
            });
            res.end();
        });
};


exports.check_username=function(req, res){
    var username =req.body.username;
    var sql_username = "SELECT * FROM `user` WHERE `username`= '"+username+"'";
    var query = db.query(sql_username, function(err, result){
        if(result.length == 0){
            res.json({
                status: 200,
                error: true,
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
                error: true,
                error_msg: '',
                response: {
                    availability: false //username already used
                }
            });
            res.end();
        }
    });
};