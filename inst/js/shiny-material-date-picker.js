$(document).ready(function () {
  
    function initShinyMaterialDatePicker(callback) {
        $('.datepicker').pickadate({});
        callback();
    }
    
    initShinyMaterialDatePicker(function () {
      
        var shinyMaterialDatePicker = new Shiny.InputBinding();
        
        $.extend(shinyMaterialDatePicker, {
            find: function (scope) {
                return $(scope).find(".shiny-material-date-picker");
            },
            getValue: function (el) {
                return $(el).val();
            },
            subscribe: function (el, callback) {
                $(el).on("change.shiny-material-date-picker", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                $(el).off(".shiny-material-date-picker");
            }
        });

        Shiny.inputBindings.register(shinyMaterialDatePicker);
    });
});
