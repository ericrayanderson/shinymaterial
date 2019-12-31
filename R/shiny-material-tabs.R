#' Place UI content within a tab
#'
#' Use this function to create tabs in your application.
#' @param tabs Named vector. The tab display names and corresponding tab ids.
#' @param color String. The accent color of the tabs. Leave blank for the default color. Must be valid css color.
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
  
  this_id <- paste0('tabs-id-', shiny:::createUniqueId(8))
  
  for(i in 1:length(tabs)){
    material_tabs[[i]] <-
      shiny::tags$li(
        class = "tab",
        shiny::tags$a(
          class = 
            paste0(
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
    
    
    tabs_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              '
            #', this_id, ' .indicator {
    position: absolute;
    bottom: 0;
    height: 2px;
    background-color: ', color, ' !important;
    will-change: left, right;
            }

    #', this_id, ' .tab a:focus, #', this_id, ' .tab a:focus.active {
    background-color: ', paste0("rgba(", paste0(as.character(col2rgb(color)[,1]), collapse = ", "), ", 0.2)"), ';
    outline: none;
}
              '
            )
          )
        )
      )
    
  } else {
    tabs_style <- shiny::tags$div()
  }

shiny::tagList(
  shiny::tags$ul(
    id = this_id,
    class = "tabs tabs-fixed-width", 
    material_tabs
  ),
  tabs_style
)
}
