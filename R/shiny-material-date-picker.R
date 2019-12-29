#' Create a shinymaterial date picker
#'
#' Build a shinymaterial date picker.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The date picker label.
#' @param color String. The date picker color. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_date_picker(
#'   input_id = "example_date_picker",
#'   label = "Date Picker"
#' )
material_date_picker <- function(input_id, label, color = NULL) {
  
  if(!is.null(color)){
    
    date_picker_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              "
              #", input_id, "_root .picker__date-display {
              background-color: ", color, ";
              }

              #", input_id, "_root .picker__close, .picker__today {
              color: ", color, ";
              }

              #", input_id, "_root .picker, .picker--opened, picker__day--infocus, .picker__day--selected:hover, picker__day--highlighted, .picker--focused {
              background-color: ", color, ";
              }

              #", input_id, "_root .picker__day--today {
              color: ", color, ";
              }
              #", input_id, "_root .picker__day--selected {
              background-color: ", color, ";
              color: #fff;
              }

              #", input_id, "_root .picker__nav--prev:hover, .picker__nav--next:hover {
              background: ", color, ";
              opacity: .5
              }
              "
            )
          )
        )
      )
    
  } else {
    date_picker_style <- shiny::tags$div()
  }
  
  create_material_object(
    js_file =
      "shiny-material-date-picker.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$label(
          `for` = input_id,
          label
        ),
        shiny::tags$input(
          type = "text", 
          class = "datepicker shiny-material-date-picker",
          id = input_id
        ),
        date_picker_style
      )
  )
}
