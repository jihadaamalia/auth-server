'use strict';

module.exports = function(app) {
 	var user = require('../controllers/userController'); //to get something outside the caller file folder
    var signup = require('../controllers/signUpController');
    var signin = require('../controllers/signInController');
    var location = require('../controllers/locationController');
    var passhandler = require('../controllers/passHandlerController');

  	app.get("/",function(req,res){
	        res.json({"Message" : "Hello World !"});
	});

  	//signUp
    app.post('/signup_user', signup.user); //signup user + user_profile
    app.post('/check_user',user.check_user); //check username availability

    //signIn
	app.post('/signin', signin.user);

	//get location
    app.get('/provinces', location.provinces); //get province
    app.get('/provinces/:prov_id', location.cities); //get city by province

	//forgot password
	app.post('/forgot_password', passhandler.forgot_password);
	app.route('/reset_password')
	    .get(passhandler.render_reset_password_template) //get website page to input new pass
	    .post(passhandler.reset_password); //update password
	app.get('/reset_password/success', passhandler.render_reset_password_success_template);

    //additional feature
    app.post('/verify_access', user.verify); //TODO move this code to app server

};
  