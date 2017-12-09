$(document).ready(function(){
  //$('ul.tabs').tabs();
  $(document).on("click", "li.tab a", function () {
    $(this).trigger("shown");
});
  $(".shiny-material-tab-content").css("visibility", "visible")
})


