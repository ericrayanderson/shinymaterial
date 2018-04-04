$(document).ready(function () {
    function initShinyMaterialDropdown(callback) {
        $('.shiny-material-dropdown').material_select();
        callback();
    }

    initShinyMaterialDropdown(function () {

        var shinyMaterialDropdown = new Shiny.InputBinding();
        $.extend(shinyMaterialDropdown, {
            find: function (scope) {
                return $(scope).find("select.shiny-material-dropdown");
            },
            getValue: function (el) {
              if(typeof($(el).val()) == "string"){
                return $(el).val().replace(new RegExp("_shinymaterialdropdownspace_", 'g'), " ");
              } else {
                return $(el).val();
              }
            },
            subscribe: function (el, callback) {
                $(el).on("change.shiny-material-dropdown", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                $(el).off(".shiny-material-dropdown");
            }
        });

        Shiny.inputBindings.register(shinyMaterialDropdown);
    });
})
