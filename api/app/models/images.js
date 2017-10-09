"use strict";

var fs = require('fs-extra');
var f = require('fs');

module.exports = {
    moveImage: function(oldName, newName, successCallBack, errorCallBack) {
        var dirOld = oldName.slice(0, oldName.lastIndexOf('/') + 1);
        var dirNew = newName.slice(0, newName.lastIndexOf('/') + 1);

        if (!fs.existsSync(dirOld)) {
            console.log("File -> " + dirOld, " Does not exist");
            errorCallBack();
            return;
        }

        fs.ensureDir(dirNew, function(err) {
            if (err) {
                errorCallBack();
                return;
            }
            // Read File
            var source = f.createReadStream(oldName);
            // Write File
            source.pipe(f.createWriteStream(newName));

            source.on("close", function(err) {
                if (err) {
                    errorCallBack();
                    return;
                }
                if (!fs.existsSync('./public/img/temp')) {
                    console.log("Directory -> ./public/img/temp Does not exist");
                    errorCallBack();
                    return;
                }
                fs.remove('./public/img/temp', function(err) {
                    if (err) {
                        errorCallBack();
                        return;
                    }
                    successCallBack();
                    console.log("Image moved from -> " + oldName + " to -> " + newName);
                });
            });
        });
    }
};