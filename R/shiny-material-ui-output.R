#' Display a shinymaterial output element
#' 
#' This function is used on the UI side to display an element rendered using render_material_ui().
#' 
#' @param material_output_id Output id from rendered material UI.
#' 
#' @details 
#' material_ui_output() is intended to be used with render_material_ui() on the server side.
#' 
#' @seealso 
#' \code{\link{render_material_ui}}
#' 
#' @examples
#' material_ui_output("renderedDropdown")
material_ui_output <- function(material_output_id){
  shiny::uiOutput(material_output_id)
}
