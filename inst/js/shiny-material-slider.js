$(document).ready(function () {

    var shinyMaterialSlider = new Shiny.InputBinding();

    $.extend(shinyMaterialSlider, {
        find: function (scope) {
            return $(scope).find(".shiny-material-slider");
        },
        getValue: function (el) {
            var classValue = $(el).find(".value").html();
            if (classValue) {
                if (classValue.length === 0) {
                    var inputValue = $(el).find('input').val();
                    return Number(inputValue);
                } else {
                    return Number(classValue);
                }
            } else {
                 var inputValue = $(el).find('input').val();
                 return Number(inputValue);
            }
        },
        subscribe: function (el, callback) {
            $(el).on("change", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shiny-material-slider");
        }
    });

    Shiny.inputBindings.register(shinyMaterialSlider);
});
