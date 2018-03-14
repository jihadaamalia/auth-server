'use strict';

module.exports = function(app) {
 	var user = require('./controllers/userController')

  	app.get("/",function(req,res){
	        res.json({"Message" : "Hello World !"});
	});

	app.post('/signup', user.signup);

	app.post('/signin', user.signin);

	app.post('/check_user',user.check_user);

	app.post('/verify_access', user.verify);

	app.route('/forgot_password')
	    .get(user.render_forgot_password_template)
	    .post(user.forgot_password);

	app.route('/reset_password')
	    .get(user.render_reset_password_template)
	    .post(user.reset_password);
};
  