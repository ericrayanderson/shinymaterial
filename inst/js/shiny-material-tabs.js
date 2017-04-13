/*
$(document).ready(function () {
    var first_id = $('.shiny-material-tab-link').first().attr("id").replace("-link", "-content");
    $("#" + first_id).css("visibility", "visible");

    $(".shiny-material-tab-link").on("click", function () {
        $(".shiny-material-tab-content").css("display", "none");
        var this_id = $(this).attr("id").replace("-link", "-content");
        $("#" + this_id).css("visibility", "visible").css("display", "block");
    });
})
*/
$(document).ready(function(){
  $(document).on("click", "li.tab a", function () {
    $(this).trigger("shown");
});
  $(".shiny-material-tab-content").css("visibility", "visible")
})


