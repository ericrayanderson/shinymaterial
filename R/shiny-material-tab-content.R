#' Place UI content within a tab
#'
#' Use this function to place UI content within a specific tab.
#' @param tab_id String. The tab id in which to place the UI content.
#' @param ... The UI elements to place in the tab.
#' @examples
#' material_tab_content(
#'   tab_id = "example_tab_1",
#'   shiny::tags$h1("Tab Content")
#' )
material_tab_content <- function(tab_id, ...){

  shiny::tagList(
    shiny::tags$div(
      class = "col s12 shiny-material-tab-content",
      id = tab_id,
      style = "visibility:hidden",
      ...
    ),
    shiny::singleton(
      shiny::includeScript(
        system.file("js/shiny-material-tabs.js",
                    package = "shinymaterial")
      )
    )
  )
}
