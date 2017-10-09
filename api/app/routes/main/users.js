"use strict";

var router = require('express').Router();
var users_model = require('../../models/users');
var oauth_wrapper = require('../../oauth/oauth_wrapper');

router.use(oauth_wrapper.authorise);

router.get('/', function(req, res) {
    // get All users
    users_model.getAll(function(data) {
        console.log(data);
        res.json(data);
    }, function(err) {
        console.log("Fail: ", err);
        res.json(data);
    });

    //users_model.create('admin', 'admin', 'ADMIN');
});

router.get('/account', function(req, res) {
    users_model.findById(req.oauth.bearerToken.user_id, function(err, result) {
        if (err) {
            res.status(503);
        }

        var account = result[0];
        res.json({
            accountId: account.id,
            accountStatus: account.status
        });
    });
});

module.exports = router;