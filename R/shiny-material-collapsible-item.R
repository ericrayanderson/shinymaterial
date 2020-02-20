#' Create a collapsible item that will contain UI content
#'
#' UI content can be placed in collapsible item to organize items on a page.
#' @param label String. The collapsible item label.
#' @param ... The UI elements to place in the collapsible item.
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param active Boolean. By default FALSE. if TRUE, the collapsible item will be active.
#' @param color String. The color of the card background. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_collapsible_item(
#'  label = "First", 
#'  icon = "filter_drama",
#'  active = TRUE,
#'  material_button("test", label = "test")
#' )
#' @seealso \code{\link{material_collapsible}}
material_collapsible_item <- function(label, ..., icon =  NULL, active = FALSE, color = "#fff") {
  tags$li(
    tags$div(
      class = paste("collapsible-header", if (active) "active"),
      if (!is.null(icon)) tags$i(class = "material-icons", icon),
      label
    ),
    tags$div(
      class = "collapsible-body",
      style = paste0("background-color: ", color),
      shiny::tags$span(...)
    )
  )
}
