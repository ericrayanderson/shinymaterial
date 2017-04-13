#' Create a card that will contain UI content
#'
#' UI content can be placed in cards to organize items on a page.
#' @param title String. The title of the card
#' @param ... The UI elements to place in the card
#' @examples
#' material_card(
#'   title = "Example Card",
#'   shiny::tags$h1("Card Content")
#' )
material_card <- function(title, ...){

  shiny::tags$div(
    class = "card",
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
