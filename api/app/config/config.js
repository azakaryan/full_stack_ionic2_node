"use strict";

//var env = process.env.env || 'prod';
var env = process.env.env || 'dev';

console.log("****************************");
console.log("    Config env is: " + process.env.env);
console.log("****************************");

var config = {
    dev: {
        port: '3000',

        api_version: 'v1',
        rest_url: function() {
            return '/api/' + this.api_version;
        },

        db: {
            dialect: 'mysql',
            multipleStatements: true,
            host: '127.0.0.1',
            user: 'root',
            password: 'root',
            database: 'irec'
        }
    },

    amazon: {
        port: '3000',

        api_version: 'v1',
        rest_url: function() {
            return '/api/' + this.api_version;
        },

        db: {
            dialect: 'mysql',
            multipleStatements: true,
            host: '127.0.0.1',
            user: 'root',
            password: 'root',
            database: 'api'
        }
    },

    prod: {
        port: '3000',

        api_version: 'v1',
        rest_url: function() {
            return '/api/' + this.api_version;
        },

        db: {
            dialect: 'mysql',
            multipleStatements: true,
            host: '127.2.251.2',
            user: 'adminQpePId1',
            password: 'FsJ81pkKD8Td',
            database: 'api'
        }
    }
};

module.exports = config[env];