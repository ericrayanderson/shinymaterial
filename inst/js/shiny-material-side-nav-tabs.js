$(document).ready(function(){
    //$('.shiny-material-side-nav-tab-content').hide();
    $('.shiny-material-side-nav-tab').first().addClass('active');
    var first_side_nav_tab_id = $('.shiny-material-side-nav-tab').first().attr("id");
    console.log(first_side_nav_tab_id);
    $('.shiny-material-side-nav-tab-content').first().css('visibility', 'visible');
    //$('.shiny-material-side-nav-tabs').first().click();
})