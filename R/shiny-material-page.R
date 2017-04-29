#' Create a shinymaterial page
#'
#' Build a shinymaterial page.
#' @param title String. The title of the page.
#' @param ... The UI elements to place in the page.
#' @param nav_bar_color Color of the navigation bar. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param background_color Page background color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_page(
#'   title = "Example Title",
#'   nav_bar_color = "red lighten-2",
#'   background_color = "blue lighten-4",
#'   shiny::tags$h1("Page Content")
#' )
material_page <- function(title, ..., nav_bar_color = NULL, background_color = "grey lighten-4"){
  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      # Fonts
      shiny::includeCSS(
        "https://fonts.googleapis.com/icon?family=Material+Icons"
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
      class = background_color,
      shiny::tags$nav(
        class = 
          ifelse(
            is.null(nav_bar_color),
            "",
            nav_bar_color
          ),
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
