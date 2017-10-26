#' Create a shinymaterial text box
#'
#' Build a shinymaterial text box.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The text box label.
#' @param color String. The accent color of the text box. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @examples
#' material_text_box(
#'   input_id = "example_text_box",
#'   label = "text box",
#'   color = "#ef5350"
#' )
material_text_box <- function(input_id, label, color = NULL){
  if(!is.null(color)){
    
    text_box_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              "
              #", input_id, "_text_box.input-field input[type=text]:focus + label {
              color: ", color, ";
              }
              #", input_id, "_text_box.input-field input[type=text]:focus {
              border-bottom: 1px solid ", color, ";
              box-shadow: 0 1px 0 0 ", color, ";
              }
              "
            )
          )
        )
      )
    
  } else {
    text_box_style <- shiny::tags$div()
  }
  create_material_object(
    js_file =
      "shiny-material-text-box.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = "input-field",
          id = paste0(input_id, "_text_box"),
          shiny::tags$input(
            id = input_id,
            type = "text",
            class = "validate"
          ),
          shiny::tags$label(
            `for` = input_id,
            label
          )
        ),
        text_box_style
      )
  )
}
