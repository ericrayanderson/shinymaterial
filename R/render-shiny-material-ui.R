#' Renders reactive UI elements using the shinymaterial package
#'
#' This function is used on the server side to render an element that is to be displayed using material_ui_output().
#'
#' @param material_ui An expression that returns shinymaterial UI elements.
#' 
#' @details 
#' render_material_ui() is intended to be used with material_ui_output() on the UI side.
#' 
#' @seealso 
#' \code{\link{material_ui_output}}
#' 
#' 
#' @examples
#' render_material_ui({
#'   material_dropdown(
#'   input_id = "renderedDropdown",
#'                     label = "Selection",
#'                     choices = c(1,2)
#'                     )
#' })
render_material_ui <- function(material_ui){
  shiny::renderUI({
    shiny::tagList(
      shiny::tags$script("M.AutoInit();"),
      material_ui
    )
  })
}
