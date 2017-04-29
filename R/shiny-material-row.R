#' Create a row to organize UI content
#'
#' UI content can be placed in a row to organize items on a page.
#' @param ... The UI elements to place in the row.
#' @examples
#' material_row(
#'   shiny::tags$h1("Row Content")
#' )
material_row <- function(...){
  shiny::tags$div(
    class = "row",
    ...
  )
}
