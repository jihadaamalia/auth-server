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
    viewPath: path.resolve(__dirname, '../templates/'),
    extName: '.html'
};

smtpTransport.use('compile', hbs(handlebarsOptions));

//-----------------------------------------forgot password-------------------------------------------


exports.forgot_password = function(req, res) {
    self = this;
    var email=req.body.email;
    var check_email = "SELECT * FROM `user` WHERE `email` = '"+email+"';";
    var query = db.query(check_email, function(err, result){
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
        } else if(result.length < 1){
            res.json({
                status: 404,
                error: true,
                error_msg: {
                    title: 'Email not registered',
                    detail: ''
                },
                response: ''
            });
            res.end();
        } else {
            self.passReset (result) ;
        }

    });

    self.passReset = function (result) {
        var newPassword = Math.random().toString(36).slice(-8);
        var dec_pass = atob(newPassword);
        var encrypted_pass = cryptr.encrypt(dec_pass);
        var password_reset = "UPDATE `user` SET `password` = '"+encrypted_pass+"' WHERE `email`= '"+email+"'";
        var query = db.query(password_reset, function(err, updateRes){
            if(err){
                res.json({
                    status: 500,
                    error: true,
                    error_msg: {
                        title: 'Update password failed',
                        detail: err
                    },
                    response: ''
                });
                res.end();
            } else {
                var data = {
                    to: result[0].email,
                    from: email,
                    template: 'forgot-password-email',
                    subject: 'Password help has arrived!',
                    context: {
                        newPass: newPassword,
                        name: result[0].username
                    }
                };
                self.sendMail (data, newPassword);
            }
        });
    }

    self.sendMail = function (data, newPassword) {
        //send email
        smtpTransport.sendMail(data, function(err) {
            if (!err) {
                res.json({
                    status: 200,
                    error: false,
                    error_msg: {
                        title: '',
                        detail: ''
                    },
                    response: 'Kindly check your email for further information'
                });
                res.end();
            } else {
                res.json({
                    status: 500,
                    error: true,
                    error_msg: {
                        title: 'Failed to send reset email, your new password is '+ newPassword,
                        detail: err
                    },
                    response: ''
                });
                res.end();
            }
        });
    }
};


//-----------------------------------------reset password-------------------------------------------

// exports.render_reset_password_template = function(req, res) {
//     return res.sendFile(path.resolve('./public/reset_password_template.html'));
// };
//
// exports.reset_password = function(req, res, next) {
//
//     var resetEmail = cryptr.decrypt(req.body.token);
//
// };
//
// exports.render_reset_password_success_template = function(req, res) {
//     return res.sendFile(path.resolve('./public/reset_password_success_template.html'));
// };