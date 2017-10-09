"use strict";

var express = require('express');
var headers = require('../config/headers');
var config = require('../config/config');
var oauth_wrapper = require('../oauth/oauth_wrapper');
var _ = require('lodash-node');
var router = express.Router();
var main_router = express.Router();

var main_apis = [{
    route: '/users',
    url: './main/users.js'
}, {
    route: '/images',
    url: './main/images.js'
}, {
    route: '/news',
    url: './main/news.js'
}, {
    route: '/registrations',
    url: './main/registrations.js'
}, {
    route: '/researches',
    url: './main/researches.js'
}];

// mysql db instance to Init/End a connection. 
var db = require('../db/db');

process.on('exit', function() {
    console.log("NODE SERVER OVER IT'S WORK");
    db.destroy();
});

module.exports = {
    init: function(app) {
        db.init();

        headers.setCrossOriginHeaders(app);

        // Init conection
        app.use(config.rest_url(), router);

        // Handle token grant requests
        router.all('/oauth/token', oauth_wrapper.grant);

        router.use('/', main_router);

        use(main_router, main_apis);

    }
};

function use(root_router, apis) {
    _.each(apis, function(api) {
        var router = require(api.url);
        root_router.use(api.route, router);
    });
}