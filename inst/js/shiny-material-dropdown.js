$(document).ready(function () {
    function initShinyMaterialDropdown(callback) {
        $('.shiny-material-dropdown').formSelect();
        callback();
    }

    initShinyMaterialDropdown(function () {

        var shinyMaterialDropdown = new Shiny.InputBinding();
        $.extend(shinyMaterialDropdown, {
            find: function (scope) {
                return $(scope).find("select.shiny-material-dropdown");
            },
            getValue: function (el) {
              var ans;
              ans = $(el).val();
              if(ans === null){
                return ans;
              }
              if(typeof(ans) == "string"){
                return ans.replace(new RegExp("_shinymaterialdropdownspace_", 'g'), " ");
              } else if(typeof(ans) == "object"){
                for (i = 0; i < ans.length; i++) { 
                  if(typeof(ans[i]) == "string"){
                  ans[i] = ans[i].replace(new RegExp("_shinymaterialdropdownspace_", 'g'), " ");
                  }
              }
              return ans;
              } else {
                return ans;
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
