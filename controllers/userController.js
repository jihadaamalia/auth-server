	/**
	* Module dependencies.
	*/
	require('dotenv').config();
	var jwt = require('jsonwebtoken');
	var atob = require('atob');
	var Cryptr = require('cryptr'),
	path = require('path');
	cryptr = new Cryptr(process.env.CRYPTER_KEY);


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

