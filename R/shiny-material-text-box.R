#' Create a shinymaterial text box
#'
#' Build a shinymaterial text box.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The text box label.
#' @param value String. Initial value.
#' @param color String. The accent color of the text box. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @seealso \code{\link{update_material_text_box}}
#' @examples
#' material_text_box(
#'   input_id = "example_text_box",
#'   label = "text box",
#'   icon = "search",
#'   color = "#ef5350"
#' )
material_text_box <- function(input_id, label, value = "", color = NULL, icon = NULL){
  
  css_id <- paste0("#", input_id, "_text_box.input-field")
  text_box_style <- if (!is.null(color))
    shiny::tagList(
      shiny::tags$head(
        shiny::tags$style(
          paste0(
            css_id, " input[type=text]:focus + label {color: ", color, ";}",
            css_id, " input[type=text]:focus {border-bottom: 1px solid ", color, ";box-shadow: 0 1px 0 0 ", color, ";}",
            if (!is.null(icon)) 
              paste0(css_id, " .prefix.active {color: ", color, ";}")
          )
        )
      )
    )
  
  text_box_icon <- if(!is.null(icon)) 
    shiny::tags$i(class = "material-icons prefix", icon)
  
  create_material_object(
    js_file = "shiny-material-text-box.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = "input-field",
          id = paste0(input_id, "_text_box"),
          text_box_icon,
          shiny::tags$input(
            id = input_id, type = "text", 
            class = "validate", value = value
          ),
          shiny::tags$label(`for` = input_id, label)
        ),
        text_box_style
      )
  )
}
