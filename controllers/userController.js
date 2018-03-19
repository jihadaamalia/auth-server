	/**
	* Module dependencies.
	*/
	require('dotenv').config();
	var jwt = require('jsonwebtoken');
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

	//------------------------------------------check user if already exist---------------------------------------------------
	
	exports.check_user=function(req, res){
		var user_name=req.body.check_user;
		var sql_username = "SELECT id FROM `login` WHERE `email`= '"+user_name+"'";
		var query = db.query(sql_username, function(err, result){
			if(result == ""){
				res.json({
					"results":
					{"status": "not found"}
				});
				res.end();
			}
			else{
				res.json({
					"results":
					{"status": "found",
					"id": result[0].id}
				});
				res.end();
			}
		});
	};
	
	//---------------------------------------login services----------------------------------------------------------
	exports.signin=function(req, res){
		var name=req.body.email;
		var pass= req.body.password;
		var dec_pass = atob(pass);
		var encrypted_pass = cryptr.encrypt(dec_pass);
		var sql="SELECT id, first_name, last_name, email FROM `login` WHERE `email`='"+name+"' and password = '"+encrypted_pass+"'";
		
		db.query(sql, function(err, results){       
			if(results != ""){                                                               
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
				}           
				
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
								"token" : token,
								"user" : results[0]
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
			else if(results == ""){
				res.json({
					"results":
					{"status": false, "dec_pass" : dec_pass, "en_pass" : encrypted_pass}                                          
				});
				res.end();
			}
		});
	};

 //-------------------------------------------check login status ----------------------------------

	exports.verify = function(req , res){
		var secret = process.env.JWT_SECRET_KEY;
		var token = req.body.token;
		var currentTime = Math.floor(Date.now() / 1000);
		jwt.verify(token, secret, { algorithms: 'HS256', audience: 'TEST' }, function(err, decoded) {
			if (err) {
				if(err.name == 'TokenExpiredError'){ 
					res.json({
						"results":
						{
							"status": false,
							"msg" : err.message
						}                                                             
					});
				} else if(err.name == 'JsonWebTokenError'){ 
					res.json({
						"results":
						{
							"status": false,
							"msg" : err.message
						}                                                             
					});
				}
			} else if (!err) { 
				var	data = JSON.parse(decoded.data);
				res.json({ 
					'data': data,
					'Decode': decoded,
					'Current Time': currentTime
				});
			}
		});
	};

	//-----------------------------------------forgot password-------------------------------------------

	exports.render_forgot_password_template = function(req, res) {
	  return res.sendFile(path.resolve('./public/forgot_password_template.html'));
	};

	exports.forgot_password = function(req, res) {
		var email=req.body.email;
		var sql_username = "SELECT * FROM `login` WHERE `email`= '"+email+"'";
		var query = db.query(sql_username, function(err, result){
			if(!result){
				res.json({
					"results":
					{"status": "not found"}
				});
				res.end();
			}
			else {
				//create random token for email TODO: create one with expired time 
				var token = cryptr.encrypt(email);

				//send email
				var data = {
					to: result[0].email,
					from: email,
					template: 'forgot-password-email',
					subject: 'Password help has arrived!',
					context: {
						url: 'http://localhost:3000/reset_password?token=' + token,
						name: result[0].first_name
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

		var password_reset = "UPDATE `login` SET `password` = '"+encrypted_pass+"' WHERE `email`= '"+resetEmail+"'";
		var query = db.query(password_reset, function(err, result){
			if(err){
				res.json({
					"status": "update password failed"
				});
				res.end();
			}
			else{
				var sql_get = "SELECT * FROM `login` WHERE `email`= '"+resetEmail+"'";
				var query = db.query(sql_get, function(err, result){
					if(!err) {
						var data = {
			              to: resetEmail,
			              from: email,
			              template: 'reset-password-email',
			              subject: 'Password Reset Confirmation',
			              context: {
			                name: result[0].first_name
			              }
			            };

			            smtpTransport.sendMail(data, function(err) {
			              if (!err) {
			                return res.json({ message: 'Password reset' });
			              } else {
			                return res.json(err);
			              }
			            });
					}
				});
			}
		});
	}