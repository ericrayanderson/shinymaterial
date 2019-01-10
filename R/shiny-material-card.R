#' Create a card that will contain UI content
#'
#' UI content can be placed in cards to organize items on a page.
#' @param title String. The title of the card
#' @param ... The UI elements to place in the card
#' @param depth Integer. The amount of depth of the card. The value should be between 0 and 5. Leave empty for the default depth.
#' @param color String. The color of the card background. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_card(
#'   title = "Example Card",
#'   depth = 5,
#'   shiny::tags$h5("Card Content")
#' )
material_card <- function(title, ..., depth = NULL, color = NULL, size=c("small", "medium", "large")){

  shiny::tags$div(
    class =
      paste(
        "card",
        ifelse(
          is.null(depth),
          "",
          paste0("z-depth-", depth)
        ),
        ifelse(
          is.null(color),
          "",
          color),
        size[1]
      ),
    shiny::tags$div(
      class = "card-content",
      shiny::tags$span(
        class = "card-title",
        title
      ),
      ...
    )
  )
}
