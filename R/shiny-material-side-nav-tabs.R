#' Place UI content within a side-nav tab
#'
#' Use this function to create side-nav tabs in your application.
#' @param tabs Named vector. The tab display names and corresponding side-nav tab ids.
#' @param color String. The accent color of the side-nav tab wave animation. Leave blank for the default color. Visit \url{http://materializecss.com/waves.html} for a list of available colors. \emph{Side-nav tab color requires using word forms of colors (e.g. 'purple').
#' @examples
#' material_side_nav_tabs(
#'   side_nav_tabs = c(
#'     "Example Side-Nav Tab 1" = "example_side_nav_tab_1",
#'     "Example Side-Nav Tab 2" = "example_side_nav_tab_2"
#'   ),
#'   color = "deep-purple"
#' )
material_side_nav_tabs <- function(side_nav_tabs, color = NULL){
  
  material_side_nav_tabs <- shiny::tagList()
  
  for(i in 1:length(side_nav_tabs)){
    material_side_nav_tabs[[i]] <-
      shiny::tags$li(
        class = "bold shiny-material-side-nav-tab",
        id = paste0(side_nav_tabs[[i]], "_tab_id"),
        shiny::tags$a(
          class = 
            paste0(
              "waves-effect ",
              ifelse(
                is.null(color),
                "",
                paste0("waves-", color)
              )
            ),
          href = "javascript:void(0)",
          onclick = paste0("$('.shiny-material-side-nav-tab-content').hide();",
                           "$('.shiny-material-side-nav-tab').removeClass('active');",
                           "$('#", side_nav_tabs[[i]], "').css('visibility', 'visible');",
                           "$('#", side_nav_tabs[[i]], "').show();",
                           "$('#", paste0(side_nav_tabs[[i]], "_tab_id"), "').addClass('active');"),
          style = "font-weight: 500; font-size: 13px",
          names(side_nav_tabs)[[i]]
        )
      )
  }
  
  shiny::tagList(
    material_side_nav_tabs
  )
}
