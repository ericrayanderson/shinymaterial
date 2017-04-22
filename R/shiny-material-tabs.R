#' Place UI content within a tab
#'
#' Use this function to create tabs in your application.
#' @param tabs Named Vector. The tab display names as well as the tab ids.
#' @examples
#' material_tabs(
#'   tabs = c(
#'     "Example Tab 1" = "example_tab_1",
#'     "Example Tab 2" = "example_tab_2"
#'   )
#' )
material_tabs <- function(tabs){

  material_tabs <- shiny::tagList()

  for(i in 1:length(tabs)){
    material_tabs[[i]] <-
      shiny::tags$li(
        class = "tab",
        shiny::tags$a(
          href = paste0("#", tabs[[i]]),
          names(tabs)[[i]]
        )
      )
  }
  shiny::tagList(
    shiny::tags$ul(
      class = "tabs tabs-fixed-width",
      material_tabs
    )
  )
}
