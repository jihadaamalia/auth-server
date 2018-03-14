/**
 * Module dependencies.
 */
require('dotenv').config();
var jwt = require('jsonwebtoken');
var atob = require('atob');
var Cryptr = require('cryptr');
cryptr = new Cryptr(process.env.CRYPTER_KEY);


/**
 * SIGNUP SERVICES
 */
exports.user=function(req , res){
    var contohJSONLOGIN = {
        "userProf": {
            "name": "Arina Haq",
            "user_dob": "2000-07-08",
            "sex": "f",
            "country": 1, //kemungkinan otomatis ke parse jd string
            "province": 10,  //kemungkinan otomatis ke parse jd string
            "city": 200,  //kemungkinan otomatis ke parse jd string
            "street": "Jalan salak timur 8 no 3",
            "photo": ""
        },
        "userLogin": {
            "username":"arina",
            "password":"halohai",
            "email":"arina@gmail.com"
        }
    };

    var userProf = req.body.userProf;
    var userLog = req.body.userLogin;

    //data user profile
    var userProfileSql = "INSERT INTO `user_profile` (`id`, `name`, `user_dob`, `sex`, `country`, `province`, `city`, `street`, `photo`, `added_at`, `updated_at`, `deleted_at`)  VALUES ( '', '" + userProf.name + "', '" + userProf.user_dob + "', '" + userProf.sex + "', '" + userProf.country + "', '" + userProf.province + "', '" + userProf.city + "', '" + userProf.street + "', '" + userProf.photo + "','','','')";

    var getId="SELECT id FROM `user_profile` WHERE `name`='"+userProf.name+"' AND password = '"+encrypted_pass+"'";
    //TODO harusnya masukin user login data dulu baru user profile (dan username jd fk di user profile
    //data user login
    var dec_pass =atob(userLog.password);
    var encrypted_pass = cryptr.encrypt(dec_pass);

    var userSql = "INSERT INTO `user`(`username`,`password`,`email`,`user_id`,`added_at`, `updated_at`, `deleted_at`) VALUES ('" + userLog.name + "', '" + encrypted_pass + "', '" + userLog.email + "', , '" + user_id + "','', '', '')";

    var query = db.query(sql, function(err, result){
        if(err) {
            res.json({
                "status": "failed",
                "err": err
            });
        } else {
            res.json({
                "status": "user added",
            });
            res.end(JSON.stringify(result));
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