"use strict";

var imagesModel = require('./images');
var db = require('../db/db');

module.exports = {
    getAll: function(successCallBack, errorCallBack) {
        // db.getConnection().query('SELECT * FROM news LEFT JOIN images ON news.image_id=images.id;', function(err, rows, fields) {
        //     if (err) {
        //         errorCallBack(err);
        //         return;
        //     }
        //     successCallBack(rows, fields);
        // });
    },
    create: function(title, data, image, successCallBack, errorCallBack) {
        // db.getConnection().query('SELECT MAX(Id) FROM news', function(err, rows) {
        //     var id = rows && rows[0] && rows[0]['MAX(Id)'] + 1;
        //     if (err && !id) {
        //         (typeof errorCallBack === 'function') && errorCallBack({
        //             status: 'error',
        //             textMsg: err
        //         });
        //         return console.log(err);
        //     }
        //     var oldPath = image.location;
        //     var newPath = image.location.replace(new RegExp(image.tempFoldername, "g"), id).replace('temp', 'news');

        //     imagesModel.moveImage(oldPath, newPath, function() {

        //         var queryImg = "INSERT INTO images (url) VALUES ('" + newPath.replace('public', '') + "')";
        //         db.getConnection().query(queryImg, function(err, rows, fields) {
        //             if (err) {
        //                 (typeof errorCallBack === 'function') && errorCallBack({
        //                     status: 'error',
        //                     textMsg: err
        //                 });
        //                 return console.log(err);
        //             }

        //             var img_id = rows.insertId;
        //             if (!img_id) {
        //                 (typeof errorCallBack === 'function') && errorCallBack({
        //                     status: 'error',
        //                     textMsg: err
        //                 });
        //                 return;
        //             }
        //             var query = "INSERT INTO news (title, data, image_id) VALUES ('" + title + "','" + data + "','" + img_id + "')";
        //             db.getConnection().query(query, function(err, rows, fields) {
        //                 if (err) {
        //                     (typeof errorCallBack === 'function') && errorCallBack({
        //                         status: 'error',
        //                         textMsg: err
        //                     });
        //                     return console.log(err);
        //                 }
        //                 (typeof successCallBack === 'function') && successCallBack({
        //                     status: 'ok',
        //                     textMsg: 'Successfully Created!!!'
        //                 });
        //             });
        //         });
        //     }, function() {
        //         (typeof errorCallBack === 'function') && errorCallBack({
        //             status: 'error',
        //             textMsg: err
        //         });
        //     });
        // });
    },
    update: function(id, title, data, successCallBack, errorCallBack) {
        // var query = "UPDATE news SET title='" + title + "', data='" + data + "' WHERE id='" + id + "' ";
        // db.getConnection().query(query, function(err, rows, fields) {
        //     if (err) {
        //         (typeof errorCallBack === 'function') && errorCallBack({
        //             status: 'error',
        //             textMsg: err
        //         });
        //         return console.log(err);
        //     }
        //     (typeof successCallBack === 'function') && successCallBack({
        //         status: 'ok',
        //         textMsg: 'Successfully Updated!!!'
        //     });
        // });
    },
    delete: function(id, successCallBack, errorCallBack) {
        // var query = "DELETE FROM news WHERE id='" + id + "' ";
        // console.log(query);
        // db.getConnection().query(query, function(err, rows, fields) {
        //     if (err) {
        //         (typeof errorCallBack === 'function') && errorCallBack({
        //             status: 'error',
        //             textMsg: err
        //         });
        //         return console.log(err);
        //     }
        //     (typeof successCallBack === 'function') && successCallBack({
        //         status: 'ok',
        //         textMsg: 'Successfully Deleted!!!'
        //     });
        // });
    }

};