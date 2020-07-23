#' Display a shinymaterial output element
#' 
#' This function is used on the UI side to display an element rendered using render_material_ui().
#' 
#' @param output_id Output id from rendered material UI.
#' 
#' @details 
#' material_ui_output() is intended to be used with render_material_ui() on the server side.
#' 
#' @seealso 
#' \code{\link{render_material_ui}}
#' 
#' @examples
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#'
#' ui <- material_page(
#'   material_ui_output("renderedDropdown")
#' )
#'
#' server <- function(input, output) {
#'   output$renderedDropdown <- render_material_ui({
#'   material_dropdown(
#'                     input_id = "renderedDropdown",
#'                     label = "Selection",
#'                     choices = c(1,2)
#'                     )
#' })
#' }
#' shinyApp(ui, server)
#' }
material_ui_output <- function(output_id){
  shiny::uiOutput(output_id)
}
