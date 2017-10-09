"use strict";

var db = require('../db/db');
var crypto_model = require('../oauth/crypto');

module.exports = {
    getAll: function(successCallBack, errorCallBack) {

        db.getConnection().query('SELECT * FROM user;', function(err, rows, fields) {
            if (err) {
                errorCallBack(err);
                return;
            }
            successCallBack(rows, fields);
        });

    },
    create: function(username, password, type) {
        var password = crypto_model.createHash(password);
        var query = "INSERT INTO user (username, type, password) VALUES ('" + username + "','" + type + "','" + password + "')";
        db.getConnection().query(query, function(err, rows, fields) {
            if (err) {
                return console.log(err);
            }
            console.log('successfully created!!!');
        });
    },
    findById: function(id, callBack) {
        var query = "SELECT user.*, admin.* FROM user LEFT JOIN admin ON admin.id=user.id WHERE user.id='" + id + "'";
        db.getConnection().query('SELECT * FROM user;', function(err, rows, fields) {
            callBack(err, rows);
        });
    }

};