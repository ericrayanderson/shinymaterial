$(document).ready(function () {
    $('.shiny-material-side-nav-tab').first().addClass('active');

    var first_side_nav_tab_id = $('.shiny-material-side-nav-tab').first().attr("id");

    var first_side_nav_tab_content_id = $('.shiny-material-side-nav-tab')
        .first()
        .attr("id")
        .replace("_tab_id", "");

    var first_side_nav_tab_content_found = $('.shiny-material-side-nav-tab-content')
        .first()
        .attr('id');

    if (first_side_nav_tab_content_id != first_side_nav_tab_content_found) {
        alert("SHINYMATERIAL ERROR [side-nav tabs]\n\nTab content code must be arranged in the same order as the tabs.\n\nFirst tab found (" + first_side_nav_tab_id.replace("_tab_id", "") + ") does not match first tab content found (" + first_side_nav_tab_content_found + ").\n\nPlease rearrange the UI code.")

        $("body").empty();
    } else {
        $('#' + first_side_nav_tab_content_id).css('visibility', 'visible');
    }
})
