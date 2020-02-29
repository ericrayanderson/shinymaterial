#' Create a shinymaterial floating button
#'
#' Build a shinymaterial floating button. The initial value is zero, and increases by one on each press.
#' @param input_id String. The input identifier used to access the value.
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param pulse Boolean. Include pulse effect.
#' @param depth Integer. The amount of depth of the floating button. The value should be between 0 and 5. Leave empty for the default depth.
#' @param color String. The color of the floating button. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_floating_button(
#'   input_id = "example_floating_button",
#'   icon = "mode_edit",
#'   depth = 5,
#'   color = "red lighten-3"
#' )
material_floating_button <- function(input_id, icon = NULL, pulse = FALSE, depth = NULL, color = NULL) {
  
  create_material_object(
    js_file =
      "shiny-material-floating-button.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class="fixed-action-btn",
          shiny::tags$button(
            class =
              paste0(
                "btn-floating btn-large waves-effect waves-light shiny-material-floating-button",
                ifelse(
                  is.null(depth),
                  "",
                  paste0(" z-depth-", depth)
                ),
                ifelse(
                  pulse,
                  " pulse",
                  ""
                ),
                ifelse(
                  is.null(color),
                  "",
                  paste0(" ", color)
                )
              ),
            style =
              ifelse(
                !is.null(color),
                "",
                "background-color:#F06C71"
              ),
            id = input_id,
            value = 0,
            shiny::tags$i(
              class = "material-icons",
              icon
            )
          )
        )
      )
  )
}
