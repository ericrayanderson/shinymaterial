$(document).ready(function () {

    var shinyMaterialTextBox = new Shiny.InputBinding();
    $.extend(shinyMaterialTextBox, {
        find: function (scope) {
            return $(scope).find(".shiny-material-text-box");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shiny-material-text-box", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shiny-material-text-box");
        }
    });

    Shiny.inputBindings.register(shinyMaterialTextBox);
});
