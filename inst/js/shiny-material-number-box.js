$(document).ready(function () {

    var shinyMaterialNumberBox = new Shiny.InputBinding();
    $.extend(shinyMaterialNumberBox, {
        find: function (scope) {
            return $(scope).find(".shiny-material-number-box");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shiny-material-number-box", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shiny-material-number-box");
        }
    });

    Shiny.inputBindings.register(shinyMaterialNumberBox);
});
