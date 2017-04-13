$(document).ready(function () {

    var shinyMaterialRadioButton = new Shiny.InputBinding();
    $.extend(shinyMaterialRadioButton, {
        find: function (scope) {
            return $(scope).find(".shiny-material-radio-button");
        },
        getValue: function (el) {
            return $(el).find('input:checked').attr('id');
        },
        subscribe: function (el, callback) {
            $(el).on("change.shiny-material-radio-button", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shiny-material-radio-button");
        }
    });

    Shiny.inputBindings.register(shinyMaterialRadioButton);

    $(".shiny-material-radio-button").find("input:first").trigger("click");

});
