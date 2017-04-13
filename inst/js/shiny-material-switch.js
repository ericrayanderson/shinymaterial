$(document).ready(function(){

var shinyMaterialSwitch = new Shiny.InputBinding();
$.extend(shinyMaterialSwitch, {
  find: function(scope) {
    return $(scope).find(".shiny-material-switch");
  },
  getValue: function(el) {
    return $(el).val();
  },
  subscribe: function(el, callback) {
    $(el).on("change.shiny-material-switch", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".shiny-material-switch");
  }
});

Shiny.inputBindings.register(shinyMaterialSwitch);
});
