$(document).ready(function () {

    var shinyMaterialFileInput = new Shiny.InputBinding();
    $.extend(shinyMaterialFileInput, {
        find: function (scope) {
            return $(scope).find(".shiny-material-file-input");
        },
        getValue: function (el) {
            //return_file

             function () {
                return read.result;
             }
            var file = el.files[0];
            if (file) {
                read = new FileReader();
                read.readAsDataURL(file);
                read.onloadend = function (callback) {
                    // console.log(read.result);
                    // return read.result;
                    // return_file();
                }
            }
        },
        subscribe: function (el, callback) {
            $(el).on("change.shiny-material-file-input", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shiny-material-file-input");
        }
    });

    Shiny.inputBindings.register(shinyMaterialFileInput);
});
