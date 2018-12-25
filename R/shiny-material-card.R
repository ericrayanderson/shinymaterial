#' Create a card that will contain UI content
#'
#' UI content can be placed in cards to organize items on a page.
#' @param title String. The title of the card
#' @param ... The UI elements to place in the card
#' @param depth Integer. The amount of depth of the card. The value should be between 0 and 5. Leave empty for the default depth.
#' @param divider logical. Should there be a divider element between card title and card content?
#' @examples
#' material_card(
#'   title = "Example Card",
#'   depth = 5,
#'   shiny::tags$h5("Card Content")
#' )
material_card <- function(title, ..., depth = NULL, divider = FALSE){
  
  shiny::tags$div(
    class = 
      paste0(
        "card",
        ifelse(
          is.null(depth),
          "",
          paste0(" z-depth-", depth)
        )
      ),
    shiny::tags$div(
      class = "card-content",
      shiny::tags$span(
        class = "card-title",
        title
      ),
      shiny::tags$div(
        class =
          paste0(
            '',
            ifelse(
              divider,
              'divider',
              ''
            )
          )
      ),
      ...
    )
  )
}
