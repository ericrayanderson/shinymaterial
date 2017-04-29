#' Add depth to a UI element
#'
#' Give a UI element the perception of depth by creating a shadow.
#' @param ... The UI elements to apply the depth.
#' @param depth Integer. The amount of depth. The value should be between 0 and 5. A value of 0 can be used to remove depth from objects that have depth by default.
#' @examples
#' material_depth(
#'   depth = 5,
#'   material_card(title = "Example Depth")
#' )
material_depth <- function(..., depth = 4){
  shiny::tags$div(
    class = paste0("z-depth-", depth),
    ...
  )
}