#' Render reactive UI shinymaterial elements
#'
#' This function is used within a shiny::renderUI(). The corresponding output is referenced using shiny::uiOutput().
#'
#' @param material_ui shinymaterial UI element(s)
#' 
#' @examples
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#'
#' ui <- material_page(
#'   uiOutput("renderedButton")
#' )
#'
#' server <- function(input, output) {
#'   output$renderedButton <- renderUI({
#'   render_material_from_server(material_button("example_button", "Button"))
#' })
#' }
#' shinyApp(ui, server)
#' }
render_material_from_server <- function(material_ui){
  shiny::tagList(
    shiny::tags$script("M.AutoInit();"),
    material_ui
  )
}
