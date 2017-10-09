"use strict";

var router = require('express').Router();
var registrations_model = require('../../models/registrations');
var oauth_wrapper = require('../../oauth/oauth_wrapper');


router.post('/', function(req, res) {
    console.log('POST to Registrations', req.body)
        // news_model.create(req.body.title, req.body.data, req.body.image, function(obj) {
        //     res.json(obj);
        // }, function(err) {
        //     res.status(503);
        // });
});

router.use(oauth_wrapper.authorise);

router.get('/', function(req, res) {
    // // get All news
    // news_model.getAll(function(data) {
    //     res.json(data);
    // }, function(err) {
    //     console.log("Fail: ", err);
    //     res.json(data);
    // });
});

router.put('/', function(req, res) {
    // news_model.update(req.body.id, req.body.title, req.body.data, function(obj) {
    //     res.json(obj);
    // }, function(err) {
    //     res.status(503);
    // });
});

router.delete('/', function(req, res) {
    // news_model.delete(req.query.id, function(obj) {
    //     res.json(obj);
    // }, function(err) {
    //     res.status(503);
    // });
});

module.exports = router;