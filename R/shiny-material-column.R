#' Create a column to organize UI content
#'
#' UI content can be placed in columns to organize items on a page.
#'
#' @param ... The UI elements to place in the column.
#' @param width Integer. The width of the column. The value should be between 1 and 12.
#' @param colClass String. Any additional class attributes for styling the column. See  \url{https://materializecss.com/grid.html} for details.
#' NOTE: "col s12" is already included inside the function.
#' @param offset Integer. The offset to the left of the column. The value should be between 0 and 11.
#'
#' @examples
#' material_column(
#'   width = 4,
#'   shiny::tags$h1("Column Content")
#' )
material_column <- function(..., width = 6, offset = 0, colClass=NULL){
  shiny::tags$div(
    class = paste0("col s12 m", width, " offset-s0 offset-m", offset, " ", ifelse(is.null(colClass), "", colClass )),
    ...
  )
}
