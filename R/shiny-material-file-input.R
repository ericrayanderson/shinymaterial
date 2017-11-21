#' Create a shinymaterial file input
#'
#' Build a shinymaterial file input.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The file input button text.
#' @param multiple Whether the user should be allowed to select and upload multiple files at once. \bold{Does not work on older browsers, including Internet Explorer 9 and earlier.}
#' @param accept A character vector of MIME types; gives the browser a hint of what kind of files the server is expecting.
#' @param placeholder The text to show before a file has been uploaded.
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
#'           label = "file",
#'           accept = c(
#'             "text/csv",
#'             "text/comma-separated-values,text/plain",
#'             ".csv")
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
                                label = "File") {
  create_material_object(
    js_file =
      "shiny-material-file-input.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = "file-field input-field",
          shiny::tags$div(
            class = "btn",
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
              class = "file-path validate", type="text"
            )
          )
        )
      )
  )
}
