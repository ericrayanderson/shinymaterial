$(document).ready(function(){
  $('.shiny-material-side-nav-tab-content').hide();
  $(document).on("click", "li.shiny-material-side-nav-tab a", function () {
    $(this).trigger("shown");
});
  $(".shiny-material-side-nav-tab-content").css("visibility", "visible")
})


