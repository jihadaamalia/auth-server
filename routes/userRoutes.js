'use strict';

module.exports = function(app) {
    var signup = require('../controllers/signUpController');
    var signin = require('../controllers/signInController');
    //var location = require('../controllers/locationController');
    var passhandler = require('../controllers/passHandlerController');

  	app.get("/",function(req,res){
	        res.json({"Message" : "Hello World !"});
            res.end();
	});

  	//signUp
    app.post('/signup_user', signup.user); //signup user + user_profile
    app.post('/check_username',signup.check_username); //check username availability

    //signIn
	app.post('/signin', signin.user);

	//forgot password
	app.post('/forgot_password', passhandler.forgot_password);

};
  