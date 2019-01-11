#' Create a card that will contain UI content
#'
#' UI content can be placed in cards to organize items on a page.
#'
#' @param title String. The title of the card
#' @param ... The UI elements to place in the card
#' @param depth Integer. The amount of depth of the card. The value should be between 0 and 5. Leave empty for the default depth.
#' @param size String. The size of the card: "small", "medium", "large"
#' @param color String. The color of the card background. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param titleClass String. Any additional class attributes for styling the card title. See  \url{https://materializecss.com/cards.html} for details. 
#' @param cardAction String. HTML code specifying content of card action section. See example for details
#'
#' @examples
#' Verbatim HTML Input
#' 
#' material_card("Sample Card",
#'               size="medium",
#'               depth = 3,
#'               titleClass = 'teal white-text',
#'               cardAction = ' <a href="https://materializecss.com/cards.html">Card Design</a>
#'                            <a href="https://shiny.rstudio.com/articles/tag-glossary.html">Shiny Tags</a> ',
#'               shiny::tags$p("Cards are a convenient means of displaying content composed of different types of objects.")
#' )
#' 
#' 
#' Pasting HTML from Shiny tags output
#' 
#' # material_card(
#'  "Sample Card",
#'   size =  "medium",
#'   depth = 3,
#'   titleClass = "indigo white-text",
#'   cardAction = paste(
#'     shiny::actionButton(
#'       inputId = 'button1',
#'       class = "red lighten-1",
#'       label = "Open App",
#'       icon = icon("th"),
#'       onclick = "window.open('http://google.com', '_blank')"
#'     )
#'   ),
#'   shiny::tags$p(
#'     "Cards are a convenient means of displaying content composed of different types of objects."
#'   )
#' )


material_card <- function(title, ...,
                          depth = NULL,
                          color = NULL,
                          size=c("small", "medium", "large"),
                          titleClass=NULL,
                          cardAction=NULL
                          ){
  # make cardAction part
  if (is.null(cardAction)) {actionHTML<-shiny::tags$div()
  } else {
    actionHTML<- shiny::tags$div(class = "card-action", shiny::tags$div( 
      HTML(cardAction) ))
    }

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
        class = paste( "card-title", ifelse(is.null(titleClass), "", titleClass) ),
        title
      ),
      HTML(paste(actionHTML)),
      ...
    )
  )
}
