#' Close a material modal programmatically.
#'
#' Close a material modal programmatically (server side).
#' @param session The session object passed to function given to shinyServer.
#' @param modal_id String. The ID of the modal to open.
#' @seealso \code{\link{open_material_modal}}
#' @examples
#' \dontrun{
#' close_material_modal(session, "example_modal")
#' }
close_material_modal <- function(session, modal_id){
  
  js_code <- paste0("$('#", modal_id, "').modal('close');")
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    js_code
  )
  
}