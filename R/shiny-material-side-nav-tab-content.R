#' Place UI content within a side-nav tab
#'
#' Use this function to place UI content within a specific side-nav tab.
#' @param tab_id String. The side-nav tab id in which to place the UI content.
#' @param ... The UI elements to place in the side nav tab.
#' @examples
#' material_side_nav_tab_content(
#'   tab_id = "example_tab_1",
#'   shiny::tags$h1("Side-Nav Tab Content")
#' )
material_side_nav_tab_content <- function(side_nav_tab_id, ...){
  
  shiny::tagList(
    shiny::tags$div(
      class = "col s12 shiny-material-side-nav-tab-content",
      id = side_nav_tab_id,
      style = "visibility:hidden",
      ...
    ),
    shiny::singleton(
      shiny::includeScript(
        system.file("js/shiny-material-side-nav-tabs.js",
                    package = "shinymaterial")
      )
    )
  )
}
