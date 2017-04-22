$(document).ready(function(){
  $(document).on("click", "li.tab a", function () {
    $(this).trigger("shown");
});
  $(".shiny-material-tab-content").css("visibility", "visible")
})


