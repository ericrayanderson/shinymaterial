$(document).ready(function () {

    var shinyMaterialCheckbox = new Shiny.InputBinding();
    $.extend(shinyMaterialCheckbox, {
        find: function (scope) {
            return $(scope).find(".shiny-material-checkbox");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shiny-material-checkbox", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shiny-material-checkbox");
        }
    });

    Shiny.inputBindings.register(shinyMaterialCheckbox);
});
