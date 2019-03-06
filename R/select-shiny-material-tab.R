#' Select a material tab programmatically.
#'
#' Select a material tab programmatically (server side).
#' @param session The session object passed to function given to shinyServer.
#' @param tab_id String. The ID of the tab to open.
#' @examples
#' \dontrun{
#' select_material_tab(session, "example_tab")
#' }
select_material_tab <- function(session, tab_id){
  
  js_code <- paste0('$(\'li.tab a[href$="#', tab_id, '"]:first\').trigger("click");')
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    js_code
  )
}