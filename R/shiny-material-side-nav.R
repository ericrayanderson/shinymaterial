#' Create a side-nav that contains UI content
#'
#' UI content can be placed in side-nav.
#' @param ... The UI elements to place in the side-nav.
#' @param fixed Boolean. Set to TRUE to keep side-nav open on large screens.
#' @param image_source String. The background image file name. Place the image in a folder labeled 'www' at the same level as the application (server.R & ui.R).
#' @param background_color Side-nav background color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @examples
#' material_side_nav(
#'   fixed = FALSE,
#'   image_source = "example_image.jpg",
#'   background_color = "blue lighten-4",
#'   shiny::tags$h1("Side-nav Content")
#' )
material_side_nav <- function(..., fixed = FALSE, image_source = NULL, background_color = NULL){
  
  if(is.null(image_source)){
    side_nav_content <- shiny::tagList(...)
  } else {
    side_nav_content <- 
      shiny::tagList(
        shiny::tags$li(
          shiny::tags$div(
            style = "height:160px",
            class = "userView",
            shiny::tags$div(
              class = "background",
              shiny::tags$img(
                style = "height:160px;width:300px",
                src = image_source
              )
            )
          )
        ),
        ...
      )
  }
  
  css_file <- 
    paste0(
      "css/shiny-material-side-nav",
      ifelse(
        fixed,
        "-fixed",
        ""
      ),
      ifelse(
        !is.null(image_source),
        "-image",
        ""
      ),
      ".css"
    )
  
  shiny::tagList(
    shiny::includeCSS(
      system.file(
        css_file,
        package = "shinymaterial"
      )
    ),
    shiny::tags$ul(
      id = "slide-out",
      class = paste0(
        "side-nav",
        ifelse(
          !is.null(background_color),
          paste0(" ", background_color),
          ""
        ),
        ifelse(
          fixed,
          " fixed",
          ""
        )
      ),
      side_nav_content
    ),
    shiny::includeScript(
      system.file(
        paste0(
          "js/shiny-material-side-nav",
          ifelse(
            fixed,
            "-fixed",
            ""),
          ".js"
        ),
        package = "shinymaterial"
      )
    )
  )
}
