#' Create a row to organize UI content
#'
#' UI content can be placed in a row to organize items on a page.
#'
#' @param rowClass String. Any additional class attributes for styling the row. See  \url{https://materializecss.com/grid.html} for details.
#' DO NOT include "row" in the string, it is already included inside the function.
#' 
#' @param ... The UI elements to place in the row.
#'
#' @examples
#' material_row(rowClass = "center-cols center-align",
#'   shiny::tags$h1("Row Content")
#' )
material_row <- function(rowClass=NULL, ...){
  #TODO remove "row" from class sting if user included it by mistake
  shiny::tags$div(
    class = paste("row", ifelse(is.null(rowClass), "", rowClass ) ),
    ...
  )
}
