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
    var userProf = req.body.userProf;
    var userLog = req.body.userLogin;

    var bin_pass = atob(userLog.password);
    var encrypted_pass = cryptr.encrypt(bin_pass);

    var userSql = "INSERT INTO `user`(`username`,`password`,`email`,`added_at`, `updated_at`, `deleted_at`) VALUES ('" + userLog.username + "', '" + encrypted_pass + "', '" + userLog.email + "', CURRENT_TIMESTAMP(), '', '')";

    var userProfileSql = "INSERT INTO `user_profile` (`id`, `name`, `user_dob`, `sex`, `country`, `province`, `city`, `street`, `photo`,`username`, `added_at`, `updated_at`, `deleted_at`)  VALUES ( '', '" + userProf.name + "', '" + userProf.user_dob + "', '" + userProf.sex + "', '" + userProf.country + "', '" + userProf.province + "', '" + userProf.city + "', '" + userProf.street + "', '" + userProf.photo + "','" + userLog.username + "', CURRENT_TIMESTAMP(),'','')";

    db.query(userSql, function(err, result){
        if(err) {
            res.json({
                "status": "failed",
                "err": err
            });
            res.end();
        } else {
            db.query(userProfileSql, function(err, result){
                if(err) {
                    res.json({
                        "status": "failed",
                        "err": err
                    });
                    res.end();
                } else {
                    var request = {
                        "body" : {
                            "username" : userLog.username,
                            "password" : userLog.password
                        }
                    };
                    signIn.user(request, res);
                }
            });
        }
    });


};

exports.pet =function(req , res){
    res.json({
        "status": "user added",
    });
};

exports.preference =function(req , res){
    res.json({
        "status": "user added",
    });
};