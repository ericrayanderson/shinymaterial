#' Create a shinymaterial number box
#'
#' Build a shinymaterial number box.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The number box label.
#' @param min_value Number. The minimum allowable value.
#' @param max_value Number. The maximum allowable value.
#' @param initial_value Number. The initial value.
#' @param step_size Number. The step size of the arrow clicks.
#' @param color String. The accent color of the number box. Leave empty for the default color. Visit \url{https://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @seealso \code{\link{update_material_number_box}}
#' @examples
#' material_number_box(
#'   input_id = "example_number_box",
#'   label = "number box",
#'   min_value = 5,
#'   max_value = 15,
#'   initial_value = 10,
#'   step_size = 2,
#'   color = "#ef5350"
#' )
material_number_box <- function(input_id, label, min_value, max_value, step_size = 1, initial_value, color = NULL){
  if(!is.null(color)){
    
    number_box_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              "
              #", input_id, "_number_box.input-field input[type=number]:focus + label {
              color: ", color, ";
              }
              #", input_id, "_number_box.input-field input[type=number]:focus {
              border-bottom: 1px solid ", color, ";
              box-shadow: 0 1px 0 0 ", color, ";
              }
              "
            )
          )
        )
      )
    
  } else {
    number_box_style <- shiny::tags$div()
  }
  
  create_material_object(
    js_file =
      "shiny-material-number-box.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = "input-field",
          id = paste0(input_id, "_number_box"),
          shiny::tags$input(
            id = input_id,
            type = "number",
            value = initial_value,
            min = min_value,
            max = max_value,
            step = step_size
          ),
          shiny::tags$label(
            `for` = input_id,
            label
          )
        ),
        number_box_style
      )
  )
}
