'use strict';

module.exports = function(app) {
 	var user = require('../controllers/userController'); //to get something outside the caller file folder
    var signup = require('../controllers/signUpController');
    var signin = require('../controllers/signInController');
    var location = require('../controllers/locationController');

  	app.get("/",function(req,res){
	        res.json({"Message" : "Hello World !"});
	});

  	//signUp
    app.post('/signup_user', signup.user); //signup user + user_profile

    //signIn
	app.post('/signin', signin.user);

	//get location
    app.get('/provinces', location.provinces); //get province
    app.get('/provinces/:prov_id', location.cities); //get city by province

	app.post('/check_user',user.check_user);
	app.post('/verify_access', user.verify); //TODO move this code to app server

	//forgot password
	app.route('/forgot_password')
	    .get(user.render_forgot_password_template)
	    .post(user.forgot_password);
	app.route('/reset_password')
	    .get(user.render_reset_password_template)
	    .post(user.reset_password);
};
  