#' Create a shinymaterial file input
#'
#' Build a shinymaterial file input.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The button text.
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param depth Integer. The amount of depth of the file input button. The value should be between 0 and 5. Leave empty for the default depth. 
#' @param color String. The color of the button. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_file_input(
#'   input_id = "example_file_input",
#'   label = "File"
#' )
material_file_input <- function(input_id, label = "File", color = NULL) {
  
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
