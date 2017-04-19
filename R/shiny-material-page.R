#' Create a shinymaterial page
#'
#' Build a shinymaterial page.
#' @param title String. The title of the page.
#' @param ... The UI elements to place in the page
#' @examples
#' material_page(
#'   title = "Example Title",
#'   shiny::tags$h1("Page Content")
#' )
material_page <- function(title, ...){
  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      # Fonts
      shiny::includeCSS(
        "http://fonts.googleapis.com/icon?family=Material+Icons"
      ),
      # Source Materialize CSS
      shiny::includeCSS(
        "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css",
        media = "screen,projection"
      ),
      shiny::includeCSS(
        system.file("css/shiny-material-page.css",
                    package = "shinymaterial")
      ),
      shiny::tags$meta(
        name="viewport",
        content="width=device-width, initial-scale=1.0"
      )
    ),
    # Body --------------------------------------------------------------------
    shiny::tags$body(
      class = "grey lighten-4",
      shiny::tags$nav(
        shiny::tags$div(
          class = "nav-wrapper",
          shiny::tags$div(
            href = "javascript:void(0)",
            class = "brand-logo",
            shiny::HTML(paste0("&nbsp;", title))
          )
        )
      ),
      ...
    ),
    # Source Materialize Javascript
    shiny::includeScript(
      "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"
    )
  )
}
