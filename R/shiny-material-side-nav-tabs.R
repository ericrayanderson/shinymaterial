#' Place UI content within a side-nav tab
#'
#' Use this function to create side-nav tabs in your application.
#' @param tabs Named vector. The tab display names and corresponding side-nav tab ids.
#' @param color String. The accent color of the tabs. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{Tab color requires using word forms of colors (e.g. 'deep-purple'). Also, lighten or darken effects do not work on tab colors.}
#' @examples
#' material_side_nav_tabs(
#'   side_nav_tabs = c(
#'     "Example Side-Nav Tab 1" = "example_side_nav_tab_1",
#'     "Example Side-Nav Tab 2" = "example_side_nav_tab_2"
#'   ),
#'   color = "deep-purple"
#' )
material_side_nav_tabs <- function(side_nav_tabs, color = NULL){
  
  material_side_nav_tabs <- shiny::tagList()
  
  for(i in 1:length(side_nav_tabs)){
    material_side_nav_tabs[[i]] <-
      shiny::tags$li(
        class = "shiny-material-side-nav-tab",
        shiny::tags$a(
          class = 
            paste0(
              "waves-effect ",
              ifelse(
                is.null(color),
                "",
                paste0(" ", color, "-text")
              )
            ),
          href = "javascript:void(0)",
          onclick = paste0("$('.shiny-material-side-nav-tab-content').hide();",
                           "$('#", side_nav_tabs[[i]],
                           "').show();"),
          names(side_nav_tabs)[[i]]
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
      material_side_nav_tabs
    )
  )
}
