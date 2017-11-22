#' Create a shinymaterial page
#'
#' Build a shinymaterial page.
#' @param ... The UI elements to place in the page.
#' @param title String. The title of the page.
#' @param nav_bar_color Color of the navigation bar. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param background_color Page background color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param font_color String. The title font color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{Title color requires using word forms of colors (e.g. "deep-purple"). Also, lighten or darken effects do not work on title colors.}
#' @examples
#' material_page(
#'   title = "Example Title",
#'   nav_bar_color = "red lighten-2",
#'   background_color = "blue lighten-4",
#'   shiny::tags$h1("Page Content")
#' )
material_page <- function(..., title = "", nav_bar_color = NULL, background_color = "grey lighten-4", font_color = NULL){
  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      # Fonts
      shiny::includeCSS(
        "https://fonts.googleapis.com/icon?family=Material+Icons"
      ),
      # Source Materialize CSS
      shiny::includeCSS(
        system.file("libs/materialize/0.99.0/css/materialize.min.css",
                    package = "shinymaterial"),
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
            class = paste0(
              "brand-logo ",
              ifelse(
                is.null(font_color),
                "",
                paste0(" ", font_color, "-text")
              )
            ),
            shiny::HTML(paste0("&nbsp;", title))
          )
        )
      ),
      ...
    ),
    # Source Materialize Javascript
    shiny::includeScript(
      system.file("libs/materialize/0.99.0/js/materialize.min.js",
                  package = "shinymaterial")
    ),
    shiny::includeScript(
      system.file("js/shiny-material-page.js",
                  package = "shinymaterial")
    ),
    tags$script("
                Shiny.addCustomMessageHandler('shinymaterialJS',
                function(code) {
console.log(code.replace(/\\//g, ''));
                eval(code.replace(/\\//g, ''));
                });
                ")
  )
}
