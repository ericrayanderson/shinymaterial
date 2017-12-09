#' Place UI content within a tab
#'
#' Use this function to create tabs in your application.
#' @param tabs Named vector. The tab display names and corresponding tab ids.
#' @param color String. The accent color of the tabs. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{Tab color requires using word forms of colors (e.g. "deep-purple"). Also, lighten or darken effects do not work on tab colors.}
#' @examples
#' material_tabs(
#'   tabs = c(
#'     "Example Tab 1" = "example_tab_1",
#'     "Example Tab 2" = "example_tab_2"
#'   ),
#'   color = "deep-purple"
#' )
material_tabs <- function(tabs, color = NULL){
  
  material_tabs <- shiny::tagList()
  
  for(i in 1:length(tabs)){
    material_tabs[[i]] <-
      shiny::tags$li(
        class = "tab",
        shiny::tags$a(
          class = 
            paste0(
              # ifelse(
              #   i == 1,
              #   "active",
              #   ""
              # ),
              ifelse(
                is.null(color),
                "",
                paste0(" ", color, "-text")
              )
            ),
          href = paste0("#", tabs[[i]]),
          names(tabs)[[i]]
        )
      )
  }
  
  if(!is.null(color)){
    material_tabs[[length(tabs) + 1]] <-
      shiny::tags$div(
        class = paste0("indicator ", color)
      )
  }
  
  shiny::tagList(
    shiny::tags$ul(
      class = "tabs tabs-fixed-width",
      material_tabs
    )
  )
}
