#' Create a shinymaterial date picker
#'
#' Build a shinymaterial date picker.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The date picker label.
#' @examples
#' material_date_picker(
#'   input_id = "example_date_picker",
#'   label = "Date Picker"
#' )
material_date_picker <- function(input_id, label) {
  
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
          type = "date", 
          class = "datepicker shiny-material-date-picker",
          id = input_id
        )
      )
  )
}
