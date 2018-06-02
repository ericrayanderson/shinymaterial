#' Query information about the side-nav tabs.
#'
#' Query information about the side-nav tabs (e.g. which tab is active).
#' @param input The input object in the shiny session.
#' @examples
#' side_nav_tabs_info(input)
side_nav_tabs_info <- function(input = NULL){
  
  if(is.null(input$side_nav_tab_info)){
    return(NULL)
  } 
  
  jsonlite::fromJSON(input$side_nav_tab_info)
}
