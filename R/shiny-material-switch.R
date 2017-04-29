#' Create a shinymaterial switch
#'
#' Build a shinymaterial switch. The value is a boolean (TRUE if 'on', FALSE if 'off').
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The switch label.
#' @param off_label String. The label for the 'off' position of the switch.
#' @param on_label String. The label for the 'on' position of the switch.
#' @param initial_value Boolean. Is the switch initially on?
#' @param color String. The color of the switch. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., '#ef5350', rather than 'red lighten-1'.}
#' @examples
#' material_switch(
#'   input_id = "example_switch",
#'   label = "Switch",
#'   off_label = "Off",
#'   on_label = "On",
#'   initial_value = TRUE,
#'   color = "#ef5350"
#' )
material_switch <- function(input_id, label, off_label, on_label, initial_value = FALSE, color = NULL){
  
  if(!is.null(color)){
    
    switch_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              "#", input_id, "_switch.switch label input[type=checkbox]:checked+.lever:after {
              background-color: ", color, "!important;
              }
              #", input_id, "_switch.switch label input[type=checkbox]:checked+.lever {
              background-color: ", color, "!important;
              }
              "
            )
          )
        )
      )
    
  } else {
    switch_style <- shiny::tags$div()
  }
  
  create_material_object(
    js_file =
      "shiny-material-switch.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$label(
          `for` = input_id,
          label
        ),
        shiny::tags$div(
          class = "switch shiny-material-switch",
          id = paste0(input_id, "_switch"),
          shiny::tags$label(
            off_label,
            shiny::HTML(
              paste0(
                '<input type="checkbox" id="',
                input_id,
                ifelse(
                  initial_value,
                  '"checked/>',
                  '"/>'
                )
              )
            ),
            shiny::tags$span(
              class = "lever"
            ),
            on_label
          )
        ),
        switch_style
      )
  )
}
