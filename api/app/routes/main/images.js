"use strict";

var router = require('express').Router();
var path = require('path');
var fs = require('fs-extra');
var randomString = require('random-string');

// Constants
var FILE_SIZE_LIMIT = 10 * 1024 * 1024;
var validExtensions = [
    'jpg',
    'jpeg',
    'png'
];
var validMimeTypes = [
    'image/jpeg',
    'image/png'
];

// Image upload
router.post('/', function(req, res) {

    var userEmail = randomString({
        length: 20
    });

    var size = req.headers['content-length'];
    if (size >= FILE_SIZE_LIMIT) {
        return res.status(413).send("File to large");
    }

    req.pipe(req.busboy);

    req.busboy.on('file', function(fieldname, file, filename, encoding, mimetype) {

        var fileExtension = path.extname(filename).substr(1).toLowerCase();
        var fileBaseName = path.basename(filename, '.' + fileExtension);

        if (validMimeTypes.indexOf(mimetype) === -1 || validExtensions.indexOf(fileExtension) === -1) {
            return res.status(400).send("invalid_file");
        }

        var dir = './public/img/temp/' + userEmail + '/';

        var fileBaseName = path.basename(filename, '.' + fileExtension);

        var baseName = fileBaseName + (new Date()).getTime();

        filename = userEmail + "." + fileExtension;
        var location = dir + filename;

        //remove old ones
        fs.remove(dir, function(err) {
            if (err) {
                return res.status(500).send("Internal server error");
            }

            fs.ensureDir(dir, function(err) {
                if (err) {
                    return res.status(500).send("Internal server error");
                }
                console.log(location, dir)
                    // Upload new image
                var fstream = fs.createWriteStream(location);
                file.pipe(fstream);
                fstream.on('close', function() {
                    res.status(200).send({
                        location: (dir.substring(2) + filename),
                        tempFoldername: userEmail
                    });
                });
                fstream.on('error', function() {
                    res.status(500).send("Internal server error");
                });
            });
        });
    });
    req.busboy.on('error', function(err) {
        return res.status(500).send("Internal server error");
    });
});


module.exports = router;