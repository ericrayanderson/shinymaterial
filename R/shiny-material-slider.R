#' Create a shinymaterial slider
#'
#' Build a shinymaterial slider.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The slider label.
#' @param min_value Number. The minimum value on the slider.
#' @param max_value Number. The maximum value on the slider.
#' @param initial_value Number. The initial value of the slider.
#' @param color String. The slider color. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., '#ef5350', rather than 'red lighten-1'.}
#' @examples
#' material_slider(
#'   input_id = "example_slider",
#'   label = "slider",
#'   min_value = 5,
#'   max_value = 15,
#'   initial_value = 10,
#'   color = "#ef5350"
#' )
material_slider <- function(input_id, label, min_value, max_value, initial_value, color = NULL){
  
  if(!is.null(color)){
    
    slider_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              '
              input[type=range].shinymaterial-slider-', input_id, '::-webkit-slider-thumb {
              background-color: ', color, ';
              }
              input[type=range].shinymaterial-slider-', input_id, '::-moz-range-thumb {
              background-color: ', color, ';
              }
              input[type=range].shinymaterial-slider-', input_id, '::-ms-thumb {
              background-color: ', color, ';
              }
              
              input[type=range].shinymaterial-slider-', input_id, ' + .thumb {
              background-color: ', color, ';
              }

              input[type=range].shinymaterial-slider-', input_id, ' + .thumb.active .value {
              color: white;
              }
              '
            )
          )
        )
      )
    
  } else {
    slider_style <- shiny::tags$div()
  }
  
  create_material_object(
    js_file =
      "shiny-material-slider.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$form(
          action = "#",
          shiny::tags$p(
            class = "range-field shiny-material-slider",
            id = input_id,
            shiny::tags$label(
              `for` = input_id,
              label
            ),
            shiny::tags$input(
              type = "range",
              class = paste0('shinymaterial-slider-', input_id),
              min = min_value,
              max = max_value,
              value = initial_value
            )
          )
        ),
        slider_style
      )
  )
}
