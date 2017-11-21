#' Create a shinymaterial file input
#'
#' Build a shinymaterial file input.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The file input button text.
#' @param color String. The color of the file input. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.  \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @examples
#' if (interactive()) {
#'   
#'   ui <- 
#'   material_page(
#'     material_row(
#'       material_column(
#'         width = 12,
#'         material_file_input(
#'           input_id = "file_1", 
#'           label = "file"
#'         )
#'       )
#'     ),
#'     material_row(
#'       material_column(
#'         width = 12,
#'         tableOutput("contents")
#'       )
#'     )
#'   )
#'   
#'   server <- function(input, output) {
#'     output$contents <- renderTable({
#'       # input$file_1 will be NULL initially. After the user selects
#'       # and uploads a file, it will be a data frame with 'name',
#'       # 'size', 'type', and 'datapath' columns. The 'datapath'
#'       # column will contain the local filenames where the data can
#'       # be found.
#'       in_file <- input$file_1
#'       
#'       if (is.null(in_file))
#'         return(NULL)
#'       
#'       read.csv(in_file$datapath)
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#'   
#' }
material_file_input <- function(input_id,
                                label = "File",
                                color = NULL) {
  
  if(!is.null(color)){
    
    file_input_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              '
    input[name=shiny-material-file-path-wrapper-', input_id, ']:not(.browser-default).valid{
    border-bottom: 1px solid', color, ' !important;
    box-shadow: 0 1px 0 0', color, ' !important;
              }
              '
            )
          )
        )
      )
    
  } else {
    file_input_style <- shiny::tags$div()
  }
  
  
  create_material_object(
    js_file =
      "shiny-material-file-input.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = "file-field input-field",
          shiny::tags$div(
            class = "btn",
            style = 
              ifelse(
                is.null(color),
                "",
                paste0("background-color:", color)
              ),
            shiny::tags$span(label),
            shiny::tags$input(
              id = input_id,
              class = "shiny-material-file-input",
              type = "file"
            )
          ),
          shiny::tags$div(
            class = "file-path-wrapper",
            shiny::tags$input(
              class = "file-path validate",
              type="text",
              name = paste0("shiny-material-file-path-wrapper-", input_id)
            )
          )
        ),
        file_input_style
      )
  )
}
