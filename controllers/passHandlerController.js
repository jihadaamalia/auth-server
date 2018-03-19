require('dotenv').config();
var atob = require('atob');
var Cryptr = require('cryptr'),
    path = require('path');
cryptr = new Cryptr(process.env.CRYPTER_KEY);
hbs = require('nodemailer-express-handlebars'),
    email = process.env.MAILER_EMAIL_ID,
    pass = process.env.MAILER_PASSWORD,
    nodemailer = require('nodemailer');
var smtpTransport = nodemailer.createTransport({
    service: process.env.MAILER_SERVICE_PROVIDER,
    secure: true,
    auth: {
        user: email,
        pass: pass
    },
    tls: {
        // do not fail on invalid certs
        rejectUnauthorized: false
    }
});

var handlebarsOptions = {
    viewEngine: 'handlebars',
    viewPath: path.resolve('./templates/'),
    extName: '.html'
};

smtpTransport.use('compile', hbs(handlebarsOptions));

//-----------------------------------------forgot password-------------------------------------------


exports.forgot_password = function(req, res) {
    var email=req.body.email;
    var sql_username = "SELECT * FROM `user` JOIN user_profile ON user_profile.username = user.username WHERE email= '"+email+"';";
    var query = db.query(sql_username, function(err, result){
        if(result == undefined){
            res.json({
                "results":
                    {"status": "not found"}
            });
            res.end();
        }
        else {
            //create random token for email TODO: create one with expired time
            var token = cryptr.encrypt(email);
            res.json({
                "results":
                    {"status": result}
            });
            //send email
            var data = {
                to: result[0].email,
                from: email,
                template: 'forgot-password-email',
                subject: 'Password help has arrived!',
                context: {
                    url: 'http://localhost:3000/reset_password?token=' + token,
                    name: result[0].name
                }
            };

            smtpTransport.sendMail(data, function(err) {
                if (!err) {
                    return res.json({ message: 'Kindly check your email for further instructions' });
                } else {
                    return res.json({ message: err});
                }
            });

        }

    });
};


//-----------------------------------------reset password-------------------------------------------

exports.render_reset_password_template = function(req, res) {
    return res.sendFile(path.resolve('./public/reset_password_template.html'));
};

exports.reset_password = function(req, res, next) {

    var resetEmail = cryptr.decrypt(req.body.token);
    var dec_pass = atob(req.body.newPassword);
    var encrypted_pass = cryptr.encrypt(dec_pass);
    var password_reset = "UPDATE `user` SET `password` = '"+encrypted_pass+"' WHERE `email`= '"+resetEmail+"'";
    var query = db.query(password_reset, function(err, result){
        if(err){
            res.json({
                "status": "update password failed"
            });
            res.end();
        }
        else{
            var sql_get = "SELECT * FROM user_profile JOIN user ON user_profile.username = user.username WHERE email= '"+resetEmail+"'";
            var query = db.query(sql_get, function(err, result){
                if(!err) {
                    var data = {
                        to: resetEmail,
                        from: email,
                        template: 'reset-password-email',
                        subject: 'Password Reset Confirmation',
                        context: {
                            name: result[0].name
                        }
                    };

                    smtpTransport.sendMail(data, function(err) {
                        if (!err) {
                            res.json({ message: 'Password reset' });
                            res.end();
                        } else {
                            return res.json(err);
                        }
                    });
                }
            });
        }
    });
};

exports.render_reset_password_success_template = function(req, res) {
    return res.sendFile(path.resolve('./public/reset_password_success_template.html'));
};