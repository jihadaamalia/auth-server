'use strict';

module.exports = function(app) {
    var signup = require('../controllers/signUpController');
    var signin = require('../controllers/signInController');
    var passhandler = require('../controllers/passHandlerController');

  	app.get("/",function(req,res){
	        res.json({"Message" : "Hello World !"});
            res.end();
	});

  	//-----------------------------------------V2----------------------------------------------------
    //users
    app.post('/users', signup.signUp); //signup user + user_profile
    app.post('/users/username',signup.check_username); //check username availability
    app.post('/users/password-reset', passhandler.forgot_password);

    //token
    app.post('/token', signin.signIn);


    //-----------------------------------------V1----------------------------------------------------

  	//signUp
    app.post('/signup_user', signup.signUp); //signup user + user_profile
    app.post('/check_username',signup.check_username); //check username availability

    //signIn
	app.post('/signin', signin.signIn);

	//forgot password
	app.post('/forgot_password', passhandler.forgot_password);

};
