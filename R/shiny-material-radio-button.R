#' Create a shinymaterial radio button
#'
#' Build a shinymaterial radio button.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The radio button label.
#' @param choices Named vector. The option names and underyling values.
#' @param selected The initially selected value (if not specified then defaults to the first value).
#' @param color String. The color of the radio buttons. Leave empty for the default color. Visit \url{https://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @param with_gap Boolean. To create a radio button with a gap.
#' @seealso \code{\link{update_material_radio_button}}
#' @examples
#' material_radio_button(
#'   input_id = "example_radio_button",
#'   label = "Radio Button",
#'   choices = c(
#'     "Cake" = "c",
#'     "Pie" = "p",
#'     "Brownie" = "b"
#'   ),
#'   color = "#ef5350"
#' )
material_radio_button <- function(input_id, label, choices, selected = NULL, color = NULL, with_gap = FALSE) {
  
  if(!is.null(color)){
    
    radio_button_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              '
              [type="radio"].shinymaterial-radio-button-', input_id,':checked+span:after,
              [type="radio"].with-gap.shinymaterial-radio-button-', input_id,':checked+span:after {
              border: 2px solid ', color, ' !important;
              background-color: ', color, ' !important;
              }
              
              [type="radio"].shinymaterial-radio-button-', input_id,':checked+span:after,
              [type="radio"].with-gap.shinymaterial-radio-button-', input_id,':checked+span:before,
              [type="radio"].with-gap.shinymaterial-radio-button-', input_id,':checked+span:after {
              border: 2px solid ', color, ' !important;
              background-color: ', color, ' !important;
              }
              
              [type="radio"].with-gap.shinymaterial-radio-button-', input_id,':checked+span:before {
              background-color: ', 'rgba(0,0,0,0)', ' !important;
              }
              '
            )
          )
        )
      )
    
  } else {
    radio_button_style <- shiny::tags$div()
  }
  
  material_radio_choices <- shiny::tagList()
  
  has_names <- !is.null(names(choices))
  choices[choices == ""] <- "_shinymaterialradioempty_"
  selected <- if (is.null(selected)) choices[[1]] else as.character(selected)
  if (length(selected) > 1) stop("The 'selected' argument must be of length 1")
  if (! selected %in% choices) stop("The 'selected' argument must be in choices")
  
  for(i in 1:length(choices)){
    material_radio_choices[[i]] <-
      shiny::tags$p(
        shiny::tags$label(
          shiny::tags$input(
            class = if (with_gap) "with-gap",
            type = "radio",
            name = input_id,
            class = if (!is.null(color)) 
              paste0('shinymaterial-radio-button-', input_id),
            id = choices[i],
            checked = if(choices[i] %in% selected) "checked"
          ),
          shiny::tags$span(ifelse(has_names, names(choices[i]), choices[i]))
        )
      )
  }
  
  create_material_object(
    js_file =
      "shiny-material-radio-button.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$form(
          action = "#",
          id = input_id,
          shiny::tags$label(
            `for` = input_id,
            label
          ),
          material_radio_choices,
          class = "shiny-material-radio-button"
        ),
        radio_button_style
      )
  )
}
