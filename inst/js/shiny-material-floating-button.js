$(document).ready(function(){
$(".shiny-material-floating-button").on("click", function() {
  var el = $(this);
  var curVal = parseInt(el.val());
  el.val(curVal + 1);
  el.trigger("change");
});

var shinyMaterialFloatingButton = new Shiny.InputBinding();
$.extend(shinyMaterialFloatingButton, {
  find: function(scope) {
    return $(scope).find(".shiny-material-floating-button");
  },
  getValue: function(el) {
    return parseInt($(el).val());
  },
  subscribe: function(el, callback) {
    $(el).on("change.shiny-material-floating-button", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".shiny-material-floating-button");
  }
});

Shiny.inputBindings.register(shinyMaterialFloatingButton);
});
