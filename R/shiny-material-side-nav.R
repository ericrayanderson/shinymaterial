#' Create a side-nav that contains UI content
#'
#' UI content can be placed in side-nav.
#' @param fixed A boolean. Set to TRUE to keep side-nav open on large screens.
#' @param ... The UI elements to place in the side-nav
#' @examples
#' material_side_nav(
#'   fixed = FALSE,
#'   shiny::tags$h1("Side-nav Content")
#' )
material_side_nav <- function(..., fixed = FALSE){

  shiny::tagList(
    shiny::includeCSS(
      system.file(
        paste0(
          "css/shiny-material-side-nav",
          ifelse(
            fixed,
            "-fixed",
            ""),
          ".css"
        ),
        package = "shinymaterial"
      )
    ),
    shiny::tags$ul(
      id = "slide-out",
      class = paste0(
        "side-nav",
        ifelse(
          fixed,
          " fixed",
          ""
        )
      ),
     # shiny::tags$div(
        class = "row",
    ##    shiny::tags$div(
    #      class = "col s10 offset-s1",
          ...
       # )
     # )
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
