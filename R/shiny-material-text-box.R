#' Create a shinymaterial text box
#'
#' Build a shinymaterial text box.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The text box label.
#' @param value String. Initial value.
#' @param color String. The accent color of the text box. Leave empty for the default color. Visit \url{https://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., "#ef5350", rather than "red lighten-1".}
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{https://materializecss.com/icons.html} for a list of available icons.
#' @seealso \code{\link{update_material_text_box}}
#' @examples
#' material_text_box(
#'   input_id = "example_text_box",
#'   label = "text box",
#'   icon = "search",
#'   color = "#ef5350"
#' )
material_text_box <- function(input_id, label, value = "", color = NULL, icon = NULL){
  if (!is.null(color)) {

    if (!is.null(icon)) {
      icon_style_color <- paste0(
      "#", input_id, "_text_box.input-field .prefix.active {
      color: ", color, ";
      }"
      )
    } else {
      icon_style_color <- ""
    }

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
              ",
              icon_style_color
            )
          )
        )
      )

  } else {
    text_box_style <- shiny::tags$div()
  }

  if (!is.null(icon)) {
    text_box_icon <- shiny::tags$i(class = "material-icons prefix", icon)
  } else {
    text_box_icon <- shiny::tags$div()
  }

  create_material_object(
    js_file =
      "shiny-material-text-box.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = "input-field",
          id = paste0(input_id, "_text_box"),
          text_box_icon,
          shiny::tags$input(
            id = input_id,
            type = "text",
            class = "validate",
            value = value
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
