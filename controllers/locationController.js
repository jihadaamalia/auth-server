exports.provinces=function(req, res){
    var provinces_sql = "SELECT * FROM `provinces`";
    var query = db.query(provinces_sql, function(err, result){
        if (err) {
            res.json({
                "err": err
            });
            res.end();
        }
        else {
            res.json({
                "results": result
            });
            res.end();
        }
    });
};

exports.cities=function(req, res){
    var cities_sql = "SELECT id, name FROM `regencies` WHERE `province_id` ='"+req.params.prov_id+"'";
    var query = db.query(cities_sql, function(err, result){
        if(err){
            res.json({
                "err": err
            });
            res.end();
        }
        else if(result){
            res.json({
                "results": result
            });
            res.end();
        }
    });
};
