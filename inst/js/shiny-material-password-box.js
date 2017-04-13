$(document).ready(function () {

    var shinyMaterialPasswordBox = new Shiny.InputBinding();
    $.extend(shinyMaterialPasswordBox, {
        find: function (scope) {
            return $(scope).find(".shiny-material-password-box");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shiny-material-password-box", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shiny-material-password-box");
        }
    });

    Shiny.inputBindings.register(shinyMaterialPasswordBox);
});
