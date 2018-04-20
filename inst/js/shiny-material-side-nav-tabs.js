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
        alert("SHINYMATERIAL ERROR [side-nav tabs]\n\nTab content code for the first tab must be located prior to tab content code for all other tabs.\n\nFirst tab found (" + first_side_nav_tab_id.replace("_tab_id", "") + ") does not match first tab content found (" + first_side_nav_tab_content_found + ").\n\nPlease rearrange the UI code.")

        $("body").empty();
    } else {
        
      $(document).on('shiny:sessioninitialized', function() {  
        
        function get_side_nav_tabs_info() {
          
        var side_nav_tabs_info = [];
          
            for (var i = 0; i < $('.shiny-material-side-nav-tab').length; i++) { 
              
              side_nav_tabs_info.push({
              id: $('.shiny-material-side-nav-tab')[i].id.slice(0, -7),
              active: $('.shiny-material-side-nav-tab').eq(i).hasClass("active")
              });
              
            }
            
            Shiny.onInputChange("side_nav_tab_info", JSON.stringify(side_nav_tabs_info));
        }
        
        get_side_nav_tabs_info();
        
       $("#side_nav_tabs_click_info").click(function() {
           get_side_nav_tabs_info();
       });
      });

        $('#' + first_side_nav_tab_id).children('a').trigger('click');
    }
})
