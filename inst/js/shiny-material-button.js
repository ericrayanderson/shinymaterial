$(document).ready(function () {
    $(".shiny-material-button").on("click", function () {
        var el = $(this);
        var curVal = parseInt(el.val());
        el.val(curVal + 1);
        el.trigger("change");
    });

    var shinyMaterialButton = new Shiny.InputBinding();
    $.extend(shinyMaterialButton, {
        find: function (scope) {
            return $(scope).find(".shiny-material-button");
        },
        getValue: function (el) {
            return parseInt($(el).val());
        },
        subscribe: function (el, callback) {
            $(el).on("change.shiny-material-button", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shiny-material-button");
        }
    });

    Shiny.inputBindings.register(shinyMaterialButton);
});
