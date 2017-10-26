#' Create a shinymaterial checkbox
#'
#' Build a shinymaterial checkbox. The value is a boolean (TRUE if checked, FALSE if not checked).
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The checkbox label.
#' @param initial_value Boolean. Is the checkbox initially checked?
#' @param color String. The color of the check. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @examples
#' material_checkbox(
#'   input_id = "example_checkbox",
#'   label = "Checkbox",
#'   initial_value = TRUE,
#'   color = "#ef5350"
#' )
material_checkbox <- function(input_id, label, initial_value = FALSE, color = NULL) {
  
  if(!is.null(color)){
    
    checkbox_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              '
              .shinymaterial-checkbox-', input_id,':checked + label:before {
              top: -4px;
              left: -3px;
              width: 12px;
              height: 22px;
              border-top: 2px solid transparent;
              border-left: 2px solid transparent;
              border-right: 2px solid ', color, ';
              border-bottom: 2px solid ', color, ';
              -webkit-transform: rotate(40deg);
              -moz-transform: rotate(40deg);
              -ms-transform: rotate(40deg);
              -o-transform: rotate(40deg);
              transform: rotate(40deg);
              -webkit-backface-visibility: hidden;
              -webkit-transform-origin: 100% 100%;
              -moz-transform-origin: 100% 100%;
              -ms-transform-origin: 100% 100%;
              -o-transform-origin: 100% 100%;
              transform-origin: 100% 100%; }
              '
            )
          )
        )
      )
    
  } else {
    checkbox_style <- shiny::tags$div()
  }
  
  create_material_object(
    js_file =
      "shiny-material-checkbox.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$form(
          action = "#",
          class = "shiny-material-checkbox",
          shiny::tags$p(
            shiny::HTML(
              paste0(
                '<input type="checkbox" id="',
                input_id,
                '"',
                ifelse(
                  is.null(color),
                  "",
                  paste0(' class="shinymaterial-checkbox-', input_id, '"')
                ),
                ifelse(
                  initial_value,
                  ' checked="checked"/>',
                  '/>'
                )
              )
            ),
            shiny::tags$label(
              `for` = input_id,
              label
            )
          )
        ),
        checkbox_style
      )
  )
}
